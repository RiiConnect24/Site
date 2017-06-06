<?php
require '../../vendor/autoload.php'; // Composer
require '../../_core.php';rc24_initialise_twig();
echo $twig->render('goodies/vote/index.html');

exit; // not really necessary, but nice to have :^)
?>
