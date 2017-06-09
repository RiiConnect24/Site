<?php
require getcwd() . '/vendor/autoload.php'; // Composer
require '_core.php';

# Recommended Sites Internet Channel.
if (isset($_GET["l"]) || isset($_GET["c"]))
{
	if ($_GET["l"] == "fr")
	{
		if ($_GET["C"] == "US")
		{
			header("Location: http://riiconnect24.net/content/US_FR/recommended_links_FR.html");
		}

		else if ($_GET["C"] == "CA")
		{
			header("Location: http://riiconnect24.net/content/CA_FR/recommended_links_FR.html");
		}

		else
		{
			header("Location: http://riiconnect24.net/content/LA_EN/recommended_links.html");
		}
	}

	else if ($_GET["l"] == "es")
	{
		if ($_GET["C"] == "US")
		{
			header("Location: http://riiconnect24.net/content/US_SP/recommended_links_SP.html");
		}

		else
		{
			header("Location: http://riiconnect24.net/content/LA_SP/recommended_links.html");
		}
	}

	else if ($_GET["l"] == "en")
	{
		if ($_GET["C"] == "US")
		{
			header("Location: http://riiconnect24.net/content/US_EN/recommended_links.html");
		}

		else if ($_GET["C"] == "CA")
		{
			header("Location: http://riiconnect24.net/content/CA_EN/recommended_links.html");
		}

		else
		{
			header("Location: http://riiconnect24.net/content/LA_EN/recommended_links.html");
		}
	}

	else
	{
		header("Location: http://riiconnect24.net/content/LA_EN/recommended_links.html");
	}
}
$twig = rc24_initialise_twig();
echo $twig->render('index.html');

exit; // not really necessary, but nice to have :^)
?>
