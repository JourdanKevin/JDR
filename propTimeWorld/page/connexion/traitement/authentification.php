<?php
    include "../../../../commun/bdd/connexion.php"; 
    include "../bdd/schema/schema.php";

    $checkOk = true;
    var_dump($_POST);
    if($_POST["user"]=="" && $_POST["mdp"]==""){
        echo "remplir les champs";
        $checkOk = false;
    }
    if ($checkOk){
        $req = $db->query(VERIFICATION($_POST));
        $data = $req->fetch(PDO::FETCH_ASSOC);
        session_start();
        if($data){       
            if(isset($_SESSION["connectRefused"])){                     
                unset($_SESSION["connectRefused"]);
            }
            var_dump($data);
            $_SESSION["user"] = $data;
            $url = $_POST["Connexion"];
            $url = explode("/",$url);
            header('Location: ../../'.$url[count($url)-2].'/'.$url[count($url)-1]);
        }
        else {
            $_SESSION["connectRefused"]["failConnect"]= true;
            $_SESSION["connectRefused"]["user"] = $_POST["user"];
            $_SESSION["connectRefused"]["mdp"] = $_POST["mdp"];
            var_dump($_SESSION["connectRefused"]);
            $url = $_POST["Connexion"];
            $url = explode("/",$url);
            header('Location: ../../'.$url[count($url)-2].'/'.$url[count($url)-1]);
        }
    }

?>