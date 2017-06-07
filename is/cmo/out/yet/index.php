<?php
require '../../../../../vendor/autoload.php'; // Composer
require '../../../../../core.php';
$twig = rc24_initialise_twig();
echo $twig->render('is/cmo/out/yet/index.html');

exit; // not really necessary, but nice to have :^)
?>
