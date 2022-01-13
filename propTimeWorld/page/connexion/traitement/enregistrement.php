<?php
    include "../../../../commun/bdd/connexion.php"; 
    include "../bdd/schema/schema.php";
    include "../../../../commun/bdd/queryTools.php";
    

    var_dump($_POST);
    $add = $db->exec(ADDUSER($_POST));
    queryError($add);
    $url = $_POST["Connexion"];
    $url = explode("/",$url);
    header('Location: ../../'.$url[count($url)-2].'/'.$url[count($url)-1]);
?>