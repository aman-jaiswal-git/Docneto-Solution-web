<?php
session_start();
include('include/config.php');
include('include/checklogin.php');
check_login();

// ✅ PDF aur QR libraries
require('fpdf/fpdf.php');
require('phpqrcode/qrlib.php');

if(isset($_POST['submit']))
{
    // sanitize inputs
    $specilization = isset($_POST['Doctorspecialization']) ? mysqli_real_escape_string($con, $_POST['Doctorspecialization']) : '';
    $doctorid      = isset($_POST['doctor']) ? intval($_POST['doctor']) : 0;
    $userid        = isset($_SESSION['id']) ? intval($_SESSION['id']) : 0;
    // fees may be missing if JS didn't set it — default to 0
    $fees_raw      = isset($_POST['fees']) ? $_POST['fees'] : '0';
    $fees          = mysqli_real_escape_string($con, $fees_raw);
    $appdate       = isset($_POST['appdate']) ? mysqli_real_escape_string($con, $_POST['appdate']) : '';
    $time          = isset($_POST['apptime']) ? mysqli_real_escape_string($con, $_POST['apptime']) : '';
    $userstatus    = 1;
    $docstatus     = 1;

    // ===== Validate user exists =====
    $checkUser = mysqli_query($con,"SELECT id, fullName,gender,age FROM users WHERE id='$userid'");
    if(!$checkUser || mysqli_num_rows($checkUser) == 0){
        // don't die; show friendly message and stop processing
        echo "<script>alert('Error: User not found. Please login again.');</script>";
    } else {
        $pData = mysqli_fetch_assoc($checkUser);

        // ===== Validate doctor exists =====
        $checkDocExist = mysqli_query($con,"SELECT id, doctorName FROM doctors WHERE id='$doctorid'");
        if(!$checkDocExist || mysqli_num_rows($checkDocExist) == 0){
            echo "<script>alert('Error: Selected doctor not found. Please select a valid doctor.');</script>";
        } else {

            // 🔹 Appointment insert
            $query = mysqli_query($con,"INSERT INTO appointment(doctorSpecialization,doctorId,userId,consultancyFees,appointmentDate,appointmentTime,userStatus,doctorStatus) 
            VALUES('$specilization','$doctorid','$userid','$fees','$appdate','$time','$userstatus','$docstatus')");

            if($query)
            {
                // ✅ User details already fetched as $pData
                $name   = $pData['fullName'];
                $age    = $pData['age'];
                $gender = $pData['gender'];

                // ✅ Doctor details fetch for name
                $dDataQ = mysqli_query($con,"SELECT doctorName, specilization FROM doctors WHERE id='$doctorid' LIMIT 1");
                $dData  = mysqli_fetch_assoc($dDataQ);

                $doctor = $dData['doctorName'] ?? 'N/A';

                // 🔹 QR Code generate
                $qrData = "Patient: $name | Doctor: $doctor | Date: $appdate | Time: $time";
                if(!is_dir("qrcodes")) { mkdir("qrcodes"); }
                $qrFile = "qrcodes/".time().".png";

                // ✅ Check GD extension
                if(!function_exists("imagecreate")){
                    echo "<script>alert('Error: PHP GD library not enabled! Please enable GD extension.');</script>";
                } else {
                    QRcode::png($qrData, $qrFile, 'L', 4, 2);
                }

                // 🔹 PDF generate
                // ---------------- PDF INVOICE START ---------------- //
                ob_start();

                $doctor_name = $dData['doctorName'] ?? 'N/A';
                $specialty   = $dData['specilization'] ?? 'N/A';

                // Other Fee Fixed
                $other_fee = 10;

                // ---- Invoice Number (Daily Reset) ----
                $today = date("dmy");
                $invFile = __DIR__."/invoice_counter.txt";
                $counter = 1;
                if (file_exists($invFile)) {
                    $dataFile = file_get_contents($invFile);
                    $saved = explode("|",$dataFile);
                    if ($saved[0] == $today) {
                        $counter = (int)$saved[1] + 1;
                    }
                }
                file_put_contents($invFile,$today."|".$counter);
                $invoice_number = $today . str_pad($counter,3,"0",STR_PAD_LEFT);

                // Total
                $total_amount = floatval($fees) + $other_fee;

                // Create PDF
                $pdf = new FPDF();
                $pdf->AddPage();

                // Background image
                $bgPath = __DIR__."/bg.png"; 
                if(file_exists($bgPath)){
                    $pdf->Image($bgPath,0,0,210,297);
                }

                $pdf->SetFont('Arial','B',30);
                $pdf->SetXY(10,18);
                $pdf->Cell(0,27,"INVOICE",0,1,'L');
                $pdf->Ln(10);

                // Doctor & Invoice Info
                $pdf->SetFont('Arial','',16);
                $pdf->MultiCell(0,10,
                    "Invoice Number: $invoice_number\n".
                    "Date: ".date("d-m-Y")."\n".
                    "Doctor Name: $doctor_name\n".
                    "Specialty: $specialty"
                );

                $pdf->Ln(5);

                // ---------------- PATIENT DETAILS ---------------- //
                $pdf->SetFont('Arial','B',18);
                $pdf->SetFillColor(0,153,0);
                $pdf->SetTextColor(255);
                $pdf->Cell(0,10,"PATIENT DETAILS",1,1,'C',true);

                $pdf->SetFont('Arial','',16);
                $pdf->SetTextColor(0);
                $pdf->MultiCell(0,15,
                    "Patient Name: $name\n".
                    "Age: $age\n".
                    "Gender: $gender\n".
                //     "Address: $patient_address\n".
                    "Appointment Date: $appdate\n".
                    "Time Slot: $time\n",
                    1
                );

                $pdf->Ln(5);

                // Total
                $pdf->SetFont('Arial','B',14);
                $pdf->SetFillColor(0,153,0);
                $pdf -> SetX(105);
                $pdf->Cell(95,12,"TOTAL AMOUNT PAID: $total_amount",1,1,'C',true);

                $pdf->Ln(10);
                $pdf->SetFont('Arial','I',14);
                $pdf->MultiCell(0,9,"Thank You For Choosing Us \nWe Hope You Recover Soon! ");

                // ---------------- QR CODE ADDITION ---------------- //
                $qrFileTemp = tempnam(sys_get_temp_dir(),'qr_').'.png';
                if(function_exists('QRcode')){
                    QRcode::png($qrData, $qrFileTemp, 'L', 3, 2);
                    $pdf->Image($qrFileTemp, 150, 220, 30, 30); // Bottom-right QR
                    @unlink($qrFileTemp);
                }

                // ---------------- Output PDF ---------------- //
                $pdf->Output("Invoice_$invoice_number.pdf","D"); 
                ob_end_flush();
            } else {
                echo "<script>alert('❌ Appointment insert failed!');</script>";
            }

        } // end doctor exists check
    } // end user exists check
}
?>

<!DOCTYPE html>
<html lang="en">
	<head>
		<title>User  | Book Appointment</title>
	
		<link href="http://fonts.googleapis.com/css?family=Lato:300,400,400italic,600,700|Raleway:300,400,500,600,700|Crete+Round:400italic" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="vendor/fontawesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="vendor/themify-icons/themify-icons.min.css">
		<link href="vendor/animate.css/animate.min.css" rel="stylesheet" media="screen">
		<link href="vendor/perfect-scrollbar/perfect-scrollbar.min.css" rel="stylesheet" media="screen">
		<link href="vendor/switchery/switchery.min.css" rel="stylesheet" media="screen">
		<link href="vendor/bootstrap-touchspin/jquery.bootstrap-touchspin.min.css" rel="stylesheet" media="screen">
		<link href="vendor/select2/select2.min.css" rel="stylesheet" media="screen">
		<link href="vendor/bootstrap-datepicker/bootstrap-datepicker3.standalone.min.css" rel="stylesheet" media="screen">
		<link href="vendor/bootstrap-timepicker/bootstrap-timepicker.min.css" rel="stylesheet" media="screen">
		<link rel="stylesheet" href="assets/css/styles.css">
		<link rel="stylesheet" href="assets/css/plugins.css">
		<link rel="stylesheet" href="assets/css/themes/theme-1.css" id="skin_color" />

		<script>
		function getdoctor(val) {
			$.ajax({
			type: "POST",
			url: "get_doctor.php",
			data:'specilizationid='+val,
			success: function(data){
				$("#doctor").html(data);
                // hide info box & clear hidden fee when specialization changes
                $('#doctorInfoBox').hide();
                $('#hiddenFees').val('');
			}
			});
		}
		</script>	


		<script>
		function getfee(val) {
			$.ajax({
			type: "POST",
			url: "get_doctor.php",
			data:'doctor='+val,
			success: function(data){
				$("#fees").html(data);
			}
			});
		}

		</script>	


	</head>
	<body>
		<div id="app">		
<?php include('include/sidebar.php');?>
			<div class="app-content">
			
						<?php include('include/header.php');?>
					
				<!-- end: TOP NAVBAR -->
				<div class="main-content" >
					<div class="wrap-content container" id="container">
						<!-- start: PAGE TITLE -->
						<section id="page-title">
							<div class="row">
								<div class="col-sm-8">
									<h1 class="mainTitle">User | Book Appointment</h1>
																	</div>
								<ol class="breadcrumb">
									<li>
										<span>User</span>
									</li>
									<li class="active">
										<span>Book Appointment</span>
									</li>
								</ol>
						</section>
						<!-- end: PAGE TITLE -->
						<!-- start: BASIC EXAMPLE -->
						<div class="container-fluid container-fullw bg-white">
							<div class="row">
								<div class="col-md-12">
									
			
									<div class="row margin-top-30">
										<div class="col-lg-8 col-md-12">
											<div class="panel panel-white">
												<div class="panel-heading">
													<h5 class="panel-title">Book Appointment</h5>
												</div>
												<div class="panel-body">
								<p style="color:red;"><?php echo htmlentities($_SESSION['msg1']);?>
								<?php echo htmlentities($_SESSION['msg1']="");?></p>	
													<form role="form" name="book" method="post" >
														


<div class="form-group">
															<label for="DoctorSpecialization">
																Doctor Specialization
															</label>
							<select name="Doctorspecialization" class="form-control" onChange="getdoctor(this.value);" required="required">
																<option value="">Select Specialization</option>
<?php $ret=mysqli_query($con,"select * from doctorspecilization");
while($row=mysqli_fetch_array($ret))
{
?>
																<option value="<?php echo htmlentities($row['specilization']);?>">
																	<?php echo htmlentities($row['specilization']);?>
																</option>
																<?php } ?>
																
															</select>
														</div>




														<div class="form-group">
															<label for="doctor">
																Doctors
															</label>
						<select name="doctor" class="form-control" id="doctor" onChange="getfee(this.value);" required="required">
						<option value="">Select Doctor</option>
						</select>
														</div>

														<!-- ====== DOCTOR DETAILS BOX (ADDED) ====== -->
														<div id="doctorInfoBox" style="display:none; border:1px solid #e5e5e5; padding:12px; border-radius:8px; margin-top:10px; background:#fafafa;">
															<div style="display:flex; gap:12px; align-items:flex-start;">
																<img id="docPhoto" src="" alt="Doctor Photo" style="width:90px; height:90px; object-fit:cover; border-radius:8px; border:1px solid #ddd;">
																<div>
																	<strong id="docName">Doctor Name</strong><br>
																	<small id="docSpec" style="color:#666;">Specialization</small><br>
																	<div style="margin-top:6px;">Fee: <strong id="docFee">-</strong></div>
																	<div style="margin-top:6px;">Available Days: <span id="docDays" style="color:#444;"></span></div>
																</div>
															</div>
														</div>
														<!-- ====== END DOCTOR DETAILS BOX ====== -->

														<!-- Hidden fees field to avoid undefined index -->
														<input type="hidden" name="fees" id="hiddenFees" value="0">

														<div class="form-group">
															<label for="consultancyfees">
																Consultancy Fees
															</label>
					<select name="fees_visible" class="form-control" id="fees"  readonly>
						
						</select>
														</div>
														

<div class="form-group">
															<label for="AppointmentDate">
																Date
															</label>
<input class="form-control datepicker" name="appdate"  required="required" data-date-format="yyyy-mm-dd">
	
														</div>
														

<div class="form-group">
															<label for="Appointmenttime">
														

														Time
													 
															</label>
			<input class="form-control" name="apptime" id="timepicker1" required="required">eg : 10:00 PM
														</div>														

														<button type="submit" name="submit" class="btn btn-o btn-primary">
															Submit
														</button>
													</form>
												</div>
											</div>
										</div>
											

											</div>
										</div>
									
									</div>
								</div>
							
						<!-- end: BASIC EXAMPLE -->
			
					
					
						
						
					
						<!-- end: SELECT BOXES -->
						
					</div>
				</div>
			</div>
			<!-- start: FOOTER -->
	<?php include('include/footer.php');?>
			<!-- end: FOOTER -->
		
			<!-- start: SETTINGS -->
	<?php include('include/setting.php');?>
			
			<!-- end: SETTINGS -->
		</div>
		<!-- start: MAIN JAVASCRIPTS -->
		<script src="vendor/jquery/jquery.min.js"></script>
		<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
		<script src="vendor/modernizr/modernizr.js"></script>
		<script src="vendor/jquery-cookie/jquery.cookie.js"></script>
		<script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
		<script src="vendor/switchery/switchery.min.js"></script>
		<!-- end: MAIN JAVASCRIPTS -->
		<!-- start: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
		<script src="vendor/maskedinput/jquery.maskedinput.min.js"></script>
		<script src="vendor/bootstrap-touchspin/jquery.bootstrap-touchspin.min.js"></script>
		<script src="vendor/autosize/autosize.min.js"></script>
		<script src="vendor/selectFx/classie.js"></script>
		<script src="vendor/selectFx/selectFx.js"></script>
		<script src="vendor/select2/select2.min.js"></script>
		<script src="vendor/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
		<script src="vendor/bootstrap-timepicker/bootstrap-timepicker.min.js"></script>
		<!-- end: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
		<!-- start: CLIP-TWO JAVASCRIPTS -->
		<script src="assets/js/main.js"></script>
		<!-- start: JavaScript Event Handlers for this page -->
		<script src="assets/js/form-elements.js"></script>
		<script>
			jQuery(document).ready(function() {
				Main.init();
				FormElements.init();
			});

			$('.datepicker').datepicker({
    format: 'yyyy-mm-dd',
    startDate: '-3d'
});
		</script>
		  <script type="text/javascript">
            $('#timepicker1').timepicker();
        </script>
		<!-- end: JavaScript Event Handlers for this page -->
		<!-- end: CLIP-TWO JAVASCRIPTS -->

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>

<!-- =============== NEW: doctor details loader =============== -->
<script>
jQuery(function($){
    // when doctor select changes, we already have inline onChange=getfee(this.value);
    // here we only fetch details for the info box (robust: handles JSON or old HTML response)
    $('#doctor').on('change', function(){
        var docId = $(this).val();
        if(!docId){
            $('#doctorInfoBox').hide();
            return;
        }

        $.ajax({
            type: 'POST',
            url: 'get_doctor.php',
            data: { doctor: docId },
            success: function(response){
                // Try parse JSON first (modern get_doctor.php should return JSON for 'doctor' param)
                var parsed = null;
                try {
                    parsed = (typeof response === 'object') ? response : JSON.parse(response);
                } catch(e) {
                    parsed = null;
                }

                if(parsed && (parsed.doctorName || parsed.docFees || parsed.docImage || parsed.available_days)){
                    // JSON path
                    var imgPath = parsed.docImage || parsed.docImagePath || '';
                    if(imgPath && imgPath.indexOf('http') === -1 && imgPath.indexOf('/') !== 0){
                        // relative filename -> try doctor-images/ prefix (adjust if your project uses different folder)
                        imgPath = 'admin/doctor-images/' + imgPath;
                    }
                    $('#docPhoto').attr('src', imgPath || 'assets/images/placeholder-doctor.png');
                    $('#docName').text(parsed.doctorName || '');
                    $('#docSpec').text(parsed.specilization || '');
                    $('#docFee').text(parsed.docFees || parsed.consultancyFees || '');
                    // set hidden fees so form submit has correct value
                    if(parsed.docFees){
                        $('#hiddenFees').val(parsed.docFees);
                        // also update visible fees select if you want
                        $('#fees').html('<option value="'+parsed.docFees+'">'+parsed.docFees+'</option>');
                    }

                    // available_days might be JSON array or comma separated string
                    var daysHTML = '';
                    var daysVal = parsed.available_days || parsed.availableDays || '';
                    try {
                        var maybeArr = (typeof daysVal === 'object') ? daysVal : JSON.parse(daysVal);
                        if(Array.isArray(maybeArr)) {
                            maybeArr.forEach(function(d){ daysHTML += '<span style=\"display:inline-block;padding:3px 8px;margin:2px;background:#eee;border-radius:12px;font-size:12px;\">'+d+'</span>'; });
                        } else {
                            daysHTML = (''+daysVal).split(',').filter(Boolean).map(function(d){ return '<span style=\"display:inline-block;padding:3px 8px;margin:2px;background:#eee;border-radius:12px;font-size:12px;\">'+d.trim()+'</span>'; }).join(' ');
                        }
                    } catch(e){
                        daysHTML = (''+daysVal).split(',').filter(Boolean).map(function(d){ return '<span style=\"display:inline-block;padding:3px 8px;margin:2px;background:#eee;border-radius:12px;font-size:12px;\">'+d.trim()+'</span>'; }).join(' ');
                    }
                    $('#docDays').html(daysHTML || '<span style=\"color:#999;\">Not set</span>');
                    $('#doctorInfoBox').fadeIn(120);
                } else {
                    // Fallback: server returned HTML (old behaviour) -> try extract fee from first <option>
                    try {
                        var $tmp = $('<div>').html(response);
                        var $opt = $tmp.find('option');
                        var fee = '';
                        if($opt.length){
                            // look for option that looks numeric (skip 'Select Doctor')
                            $opt.each(function(i,el){
                                var v = $(el).val();
                                if(v && v !== '' && isFinite(v)){
                                    fee = v;
                                    return false;
                                }
                            });
                            if(!fee) fee = $opt.first().val() || $opt.first().text();
                        }
                        if(fee){
                            $('#docFee').text(fee);
                            $('#hiddenFees').val(fee);
                            $('#docPhoto').attr('src','assets/images/placeholder-doctor.png');
                            $('#docName').text($('#doctor option:selected').text() || 'Doctor');
                            $('#docDays').html('<span style=\"color:#999;\">Not set</span>');
                            // also set visible fees select
                            $('#fees').html('<option value="'+fee+'">'+fee+'</option>');
                            $('#doctorInfoBox').fadeIn(120);
                        } else {
                            $('#doctorInfoBox').hide();
                        }
                    } catch(err){
                        console.error('Parsing fallback failed', err);
                        $('#doctorInfoBox').hide();
                    }
                }
            },
            error: function(xhr, status, err){
                console.error('Ajax error fetching doctor details:', err, xhr.responseText);
                $('#doctorInfoBox').hide();
            }
        });
    });
});
</script>
<!-- ========================================================= -->

	</body>
</html>
