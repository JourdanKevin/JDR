
<?php
    define('DSN','mysql:host=localhost; dbname=jdr'); // la localisation de notre bdd et 
    //le nom de la base de donnée que l'on veut se connecter
    define('USER','root'); // nom d'utilisateur pour ce connecter
    define('MDP',''); // le mot de passe
    // on met ces 3 donnée dans des constante pour les utiliser dans la fonction qui suit

    try{ // Gestion des erreurs de connexion
            $db = new PDO(DSN, USER, MDP); // connexions a la bdd avec nos constante,
            // dans cette ordre précis
    }
    catch (Exception $e){
            die('Erreur : ' . $e->getMessage()); // si erreur afficher l'erreur
    }
    
    function closeConnexion($db){
        if ($db) // Pour fermer la connexions 
            $db = NULL;
        return $db;
    }
?>