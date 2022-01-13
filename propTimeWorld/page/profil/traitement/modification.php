<?php
    include "../../../../commun/bdd/connexion.php"; 
    include "../bdd/schema/schema.php";

    $SQlreq = MODIFICATION($_POST);
    var_dump($_SESSION);
    if ($SQlreq){
        echo($SQlreq);
        $add = $db->exec($SQlreq);
        $req = $db->query(VERIFICATION($_SESSION["user"]));
        $data = $req->fetch(PDO::FETCH_ASSOC);
        if($data){
            session_start();
            var_dump($data);
            $_SESSION["user"] = $data;
            $url = $_POST["Connexion"];
            $url = explode("/",$url);
            header('Location: ../../'.$url[count($url)-2].'/'.$url[count($url)-1]);
    }
    }
?>