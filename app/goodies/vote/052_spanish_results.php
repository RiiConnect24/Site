<?php
require '../../../../../vendor/autoload.php'; // Composer
require '../../_core.php';
$twig = rc24_initialise_twig();
echo $twig->render('goodies/vote/052_spanish_results.html');

exit; // not really necessary, but nice to have :^)
?>