<?php
require '../vendor/autoload.php'; // Composer
require '../_core.php';
$twig = rc24_initialise_twig(getcwd() . "/../views/");
echo $twig->render('errors/403.html');

exit; // not really necessary, but nice to have :^)
?>
