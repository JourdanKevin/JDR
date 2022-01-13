<?php include "../../commun/component/topbar.php"; titre("Bonjour ".ucfirst($_SESSION["user"]["pseudo"]));?>

<body>
    <!-- <h1>Bonjour <?php echo ucfirst($_SESSION["user"]["pseudo"]); ?></h1> -->
    <p>Vous êtes un <?php 
if ($_SESSION["user"]["pseudo"] === "hab"){
    $rang = "admin";
}
else{
    $rang = $_SESSION["user"]["nomType"];
}
echo $rang;  ?></p>

    <form id="modifProfile" method="post" onsubmit="" action="traitement/modification.php">

        <a class="aMod" onclick="ChangeMDPShow()" id="changeMDP" style="cursor : pointer;">modifier votre mot de passe</a>
        <br>
        <input id="Changemdp" type="hidden" placeholder="Mot de passe" name="mdp" required>
        <input id='ChangepassConf' type="hidden" placeholder="Confirmation mot de passe" class="mdp2" name="passconf"
            required>
        <br>
        <a class="aMod" onclick="ChangeMailShow()" id="changeMail" style="cursor : pointer;">modifier votre email :
            <?php echo $_SESSION["user"]["mail"]?></a>
        <input id='Changemail' type="hidden" placeholder="mail" name="mail"
            value="<?php echo $_SESSION["user"]["mail"]?>" required>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <div id="bMod" class="bModifier">
            <?php echo '<button id="butModi" type="submit" value='.$_SERVER["REQUEST_URI"].' name="Connexion" >Modifier</button>' ?>
        </div>
    </form>

    <script>
    function changeMailHiddenInter() {
        ChangeMailHidden( <?php echo json_encode($_SESSION["user"]["mail"]); ?> );
    }
    </script>

</body>

<?php include "../../commun/component/footbar.php";?>