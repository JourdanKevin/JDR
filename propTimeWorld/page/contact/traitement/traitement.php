<?php

    include "../../../../commun/bdd/connexion.php"; 
    include "../bdd/schema/schema.php";
    include "../../../../commun/function/mail.php";

    var_dump($_POST);
    smtpMailer(array($_POST["mail"],"proptimeworld@gmail.com"), $_POST["name"],"contact message", $_POST["message"], $_POST["mail"]);
    $url = $_POST["envoyer"];
    $url = explode("/",$url);
    header('Location: ../../'.$url[count($url)-2].'/'.$url[count($url)-1]);


?>