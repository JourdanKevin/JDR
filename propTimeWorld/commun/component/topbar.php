<?php
    include "../../commun/component/headDefault.php"; 
    include '../../../commun/class/Menu/Menu.php';
    session_start();    
    if(isset($_SESSION["connectRefused"])){
        $failConnect = $_SESSION["connectRefused"];
        $fail = $failConnect["failConnect"];
        $user = $failConnect["user"];
        $mdp = $failConnect["mdp"];        
    }   
    else{
        $fail = false;
        $user = "";
        $mdp =  "";
    }
    include "../connexion/connexion.php";
    if($fail){
        echo "<script type='text/javascript'>document.getElementById('modal-wrapper').style.display='block';</script>";
        $_SESSION["connectRefused"]["failConnect"] = false;
    }  
   
   
    function titre($title){
        $menu = new Menu(); 
        $identifier = True;        
        if (!isset($_SESSION["user"])){                     
            $identifier= False;
            $typeuser = "";
        }
        else {
            $typeuser = $_SESSION["user"]["nomType"];
        }   

        $navigation = array();
        if($dossier = opendir('../'))
            while(false !== ($fichier = readdir($dossier))) if($fichier != '.' && $fichier != '..' && $fichier !== "connexion" && $fichier !== "profil"){
                $temp = explode("$",$fichier);
                if (count($temp) === 1 ) $navigation[$fichier] = "../".$fichier."/".$fichier.".php" ;
                elseif ($identifier && $_SESSION["user"][$temp[1]]) $navigation[$temp[0]] = "../".$fichier."/".$temp[0].".php" ;
            }
        if ($identifier) $tConnect = array("<a class=\"connexion\" href='../connexion/traitement/deco.php'>Deconnexion</a>","<a class=\"connexion\" href='../profil/profil.php'>".ucfirst($_SESSION["user"]["pseudo"])."</a>");                  
        else $tConnect = array("<a class=\"connexion\" onclick=\"document.getElementById('modal-wrapper').style.display='block'\" >Se connecter/S'inscrire</a>");

        echo '<header>';
            $menu->createMenu($navigation,$tConnect);
            $menu->createTitle($title);
        echo '</header>';
    }
?>

