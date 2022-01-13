<?php
    function VERIFICATION($tvalue){
        return "SELECT user.id, user.nom, user.prenom, user.mdp, user.mail, typeuser.nomType, user.pseudo FROM user JOIN typeuser WHERE pseudo=\"".$tvalue['pseudo']."\" AND mdp=\"".$tvalue['mdp']."\"AND user.id_typeUser=typeuser.id;";
    }
    function ADDUSER($tvalue){
        return "INSERT INTO `user`(`nom` , `prenom` , `pseudo` , `mail` , `mdp`, `id_typeUser` ) VALUES (\"".$tvalue['Nom']."\", \"".$tvalue['Prenom']."\", \"".$tvalue['user']."\",\" ".trim($tvalue['mail'])."\", \"".$tvalue['mdp']."\", 2);";
    }
    function FORGETMDP($tvalue){
        return "SELECT pseudo,mdp FROM user JOIN typeuser WHERE mail=\"".trim($tvalue['mail'])."\" AND user.id_typeUser=typeuser.id;";
    }
    function MODIFICATION($tvalue){
        $reqSQL = "UPDATE user SET ";
        $mdp = false;
        $mail = false;
        session_start();
        // var_dump($_SESSION);
        // var_dump($tvalue);
        if ($tvalue["mdp"]!== ""){
            $reqSQL = $reqSQL."mdp=\"".$tvalue["mdp"]."\" ";
            $mdp = true;
        }
        if($tvalue["mail"] !== $_SESSION["user"]["mail"]){
            if ($mdp){$reqSQL = $reqSQL.", ";}
            $reqSQL = $reqSQL."mail=\"".$tvalue["mail"]."\" ";
            $mail = true;
        }
        if($mdp || $mail){
            return $reqSQL = $reqSQL."WHERE id=".$_SESSION["user"]["id"].";";
        }
        else {return false;}
        //Generer la requete en fonction

    }
?>