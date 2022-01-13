<?php
    function VERIFICATION($tvalue){
        return "SELECT user.id, user.nom, user.prenom, user.mdp, user.mail, typeuser.nomType, user.pseudo FROM user JOIN typeuser WHERE pseudo=\"".$tvalue['user']."\" AND mdp=\"".$tvalue['mdp']."\"AND user.id_typeUser=typeuser.id;";
    }
    function ADDUSER($tvalue){
        return "INSERT INTO `user`(`nom` , `prenom` , `pseudo` , `mail` , `mdp`, `id_typeUser` ) VALUES (\"".$tvalue['Nom']."\", \"".$tvalue['Prenom']."\", \"".$tvalue['user']."\",\" ".trim($tvalue['mail'])."\", \"".$tvalue['mdp']."\", 2);";
    }
    function FORGETMDP($tvalue){
        return "SELECT pseudo,mdp FROM user JOIN typeuser WHERE mail=\"".trim($tvalue['mail'])."\" AND user.id_typeUser=typeuser.id;";
    }
?>