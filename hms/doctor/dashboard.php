<?php
session_start();
include('include/config.php');
error_reporting(0);

// Agar login nahi hai to redirect karo
if (!isset($_SESSION['dlogin']) || strlen($_SESSION['dlogin']) == 0) {
    header('Location: index.php');
    exit();
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Doctor | Dashboard</title>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="vendor/fontawesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="vendor/themify-icons/themify-icons.min.css">
    <link href="vendor/animate.css/animate.min.css" rel="stylesheet" media="screen">
    <link href="vendor/perfect-scrollbar/perfect-scrollbar.min.css" rel="stylesheet" media="screen">
    <link href="vendor/switchery/switchery.min.css" rel="stylesheet" media="screen">
    <link rel="stylesheet" href="assets/css/styles.css">
    <link rel="stylesheet" href="assets/css/plugins.css">
    <link rel="stylesheet" href="assets/css/themes/theme-1.css" id="skin_color" />
</head>
<body>
<div id="app">
    <?php include('include/sidebar.php'); ?>
    <div class="app-content">
        <?php include('include/header.php'); ?>
        <div class="main-content">
            <div class="wrap-content container" id="container">
                <section id="page-title">
                    <div class="row">
                        <div class="col-sm-8">
                            <h1 class="mainTitle">Doctor | Dashboard</h1>
                        </div>
                        <ol class="breadcrumb">
                            <li><span>Doctor</span></li>
                            <li class="active"><span>Dashboard</span></li>
                        </ol>
                    </div>
                </section>
                <div class="container-fluid container-fullw bg-white">
                    <div class="row">
                        <div class="col-sm-4">
                            <div class="panel panel-white no-radius text-center">
                                <div class="panel-body">
                                    <span class="fa-stack fa-2x">
                                        <i class="fa fa-square fa-stack-2x text-primary"></i>
                                        <i class="fa fa-smile-o fa-stack-1x fa-inverse"></i>
                                    </span>
                                    <h2 class="StepTitle">My Profile</h2>
                                    <p class="links cl-effect-1">
                                        <a href="edit-profile.php">Update Profile</a>
                                    </p>
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-4">
                            <div class="panel panel-white no-radius text-center">
                                <div class="panel-body">
                                    <span class="fa-stack fa-2x">
                                        <i class="fa fa-square fa-stack-2x text-primary"></i>
                                        <i class="fa fa-plus fa-stack-1x fa-inverse"></i>
                                    </span>
                                    <h2 class="StepTitle">My Appointments</h2>
                                    <p class="links cl-effect-1">
                                        <a href="appointment-history.php">View Appointments</a>
                                    </p>
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-4">
                            <div class="panel panel-white no-radius text-center">
                                <div class="panel-body">
                                    <span class="fa-stack fa-2x">
                                        <i class="fa fa-square fa-stack-2x text-primary"></i>
                                        <i class="fa fa-list-ul fa-stack-1x fa-inverse"></i>
                                    </span>
                                    <h2 class="StepTitle">Patients</h2>
                                    <p class="links cl-effect-1">
                                        <a href="manage-patient.php">Manage Patients</a>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div><!-- end row -->
                </div>
            </div>
        </div>
    </div>
    <?php include('include/footer.php'); ?>
</div>

<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="vendor/modernizr/modernizr.js"></script>
<script src="vendor/jquery-cookie/jquery.cookie.js"></script>
<script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="vendor/switchery/switchery.min.js"></script>
<script src="assets/js/main.js"></script>
<script>
    jQuery(document).ready(function() {
        Main.init();
    });
</script>
</body>
</html>
