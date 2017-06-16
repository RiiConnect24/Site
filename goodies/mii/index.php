<?php
require '../../vendor/autoload.php'; // Composer
require '../../_core.php';
$twig = rc24_initialise_twig(getcwd() . "/../../views/");
echo $twig->render('goodies/mii/index.html');

exit; // not really necessary, but nice to have :^)
?>
