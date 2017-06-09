<?php

function rc24_initialise_twig($dir = '') {
	// If there's no other dir specified, let's assume it's loading in the same dir we are.
  if ($dir == '') {
		$dir = getcwd() . "/views/";
	}
	$loader = new Twig_Loader_Filesystem($dir, array('debug' => true)); // initialise Twig stuff
	return new Twig_Environment($loader);
}
?>
