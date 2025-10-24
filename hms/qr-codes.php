<?php
$dir = 'qr_codes';
if (!is_dir($dir)) {
    mkdir($dir, 0777, true); // creates folder with write permissions
}
$filename = $dir . '/patient.png';
QRcode::png($data, $filename, 'L', 3, 2);
?>