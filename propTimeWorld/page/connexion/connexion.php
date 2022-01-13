
    
    <div id="modal-wrapper" class="modal">

        <form id="formulaire" onsubmit="" method="post" class="modal-content animate"
            action="../connexion/traitement/authentification.php">

            <div class="imgcontainer">
                <span onclick="inscriptionClose()" class="close" title="Close PopUp">&times;</span>
                <h1  id="titleCo" style="text-align:center">Connectez-vous</h1>
            </div>

            <div class="container">
                <input id="user" type="text" placeholder="Nom d'utilisateur" name="user" required value=<?php echo $user;?> >
                <input id="mdp" type="password" placeholder="Mot de passe" name="mdp" required value=<?php echo $mdp;?>>
                <?php if($fail){
                    echo "<p style='color : #c22d2d; font-size: 20px;;'>Votre mot de passe ou nom d'utilisateur est incorrect</p>";
                } ?>

                <input id='passConf' type="hidden" placeholder="Confirmation mot de passe" class="mdp2" name="mdp2"
                    required>
                <input id='nom' type="hidden" placeholder="Nom" name="Nom" required>
                <input id='prenom' type="hidden" placeholder="Prenom" name="Prenom" required>
                <input id='mail' type="hidden" placeholder="mail" name="mail" required>

                <?php echo '<button id="buttCo" type="submit" value='.$_SERVER["REQUEST_URI"].' name="Connexion" >Se connecter</button>' ?>
                <br>
                <a onclick="inscriptionShow()" id="pasInscrit"
                    style="text-decoration:none; float:left; margin-left:5.5%; margin-top:26px; cursor:pointer">Pas
                    inscrit ?</a>
                <a onclick="mdpForgetShow()" id="mdpForget" style="text-decoration:none; float:right; margin-right:5.5%; margin-top:26px;cursor:pointer">Mot de passe
                    oublié ?</a>
                <br><br><br><br>

            </div>

        </form>

    </div>

<script type="text/javascript">var modal = document.getElementById('modal-wrapper');</script>

