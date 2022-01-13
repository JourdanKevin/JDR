<?php
    function queryError($exe){
        if ($exe === false){
            echo 'prob dans la requete<br>';
            return false;
        }
        else if ($exe == 0){
            echo 'non effectuer<br>';
            return false;
        }        
        else{
            echo 'succes!<br>';
            return true;
        }
    }
?>