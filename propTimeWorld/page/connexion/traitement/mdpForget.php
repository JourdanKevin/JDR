<?php
    include "../../../../commun/bdd/connexion.php"; 
    include "../bdd/schema/schema.php";
    include "../../../../commun/bdd/queryTools.php";
    include "../../../../commun/function/mail.php";

    $req = $db->query(FORGETMDP($_POST));
    $data = $req->fetch(PDO::FETCH_ASSOC);
    if ($data){
    var_dump($data);
        $body = "Oublie de votre mot de passe <br> user : ".$data["pseudo"]."<br> password : ".$data["mdp"];
        smtpMailer(array($_POST["mail"]), "propTimeWorld","Oublie de mot de passe", $body);
    }
    $url = $_POST["Connexion"];
    $url = explode("/",$url);
    header('Location: ../../'.$url[count($url)-2].'/'.$url[count($url)-1]);

    ?>