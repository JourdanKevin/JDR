<?php include "../../commun/component/topbar.php"; titre("Contact");?>
<?php
    if (isset($_SESSION["user"])){
    $session = $_SESSION["user"];
    $name = $session["nom"].' '.$session["prenom"];
    $mail = $session["mail"];
    }
    else{
        $name = "";
        $mail = "";
    }


?>

    <body>
        <h1> Vous souhaitez nous contacter ? Envoyez nous un mail :
        <!-- <iframe src="https://discordapp.com/widget?id=709439222951575662&theme=dark" width="350" height="500" allowtransparency="true" frameborder="0"></iframe> -->
        
        <form class = "Contact" onsubmit="return checkMail('mailContact')" action="traitement/traitement.php" method="post">
            <div>
                <!-- <label for="name">Nom :</label> -->
                <input class="cInput" type="text" id="nameContact" name="name" placeholder="Nom" <?php if($name){echo "";} else{ echo "autofocus";} ?> value=<?php echo $name ;?> >
                <!-- <label for="mail">email :</label> -->
                <input class="cInput" type="email" id="mailContact" name="mail" placeholder="Entrez votre E-mail" value=<?php echo $mail ?>>
            </div>
            <div>
                <!-- <label for="msg">Message :</label> -->
                <textarea class="message" id="contactMsg" cols="150%" rows="10" name="message" placeholder="Entrez votre message" <?php if($name){echo "autofocus";} else{ echo "";} ?>></textarea>
            </div>
            <div>
                <!-- <button class="cButton" type="submit" >Envoyer</button> -->
                <?php echo '<button class="cButton" type="submit" value='.$_SERVER["REQUEST_URI"].' name="envoyer" >Envoyer</button>' ?>
            </div>
        </form>
    </body>

    <?php include "../../commun/component/footbar.php";?>

</html>