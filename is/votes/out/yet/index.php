<?php
require '../../../../vendor/autoload.php'; // Composer
require '../../../../_core.php';
$twig = rc24_initialise_twig(getcwd() . "/../../../../views/");
echo $twig->render('is/votes/out/yet/index.html');

exit; // not really necessary, but nice to have :^)
?>
