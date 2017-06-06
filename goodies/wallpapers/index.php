<?php
require '/var/www/riiconnect24.net/public_html/vendor/autoload.php'; // Composer
require '/var/www/riiconnect24.net/public_html/_core.php';
$twig = rc24_initialise_twig();
echo $twig->render('goodies/wallpapers/index.html');

exit; // not really necessary, but nice to have :^)
?>
