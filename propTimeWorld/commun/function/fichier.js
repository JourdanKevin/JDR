function checkForm(mdp1 = "mdp", mdp2 = "passConf", mail = "mail") {
    if (checkMDP(mdp1, mdp2) === false) { return false; }
    if (checkMail(mail) === false) { return false; }
    return true
}

function checkMDP(mdp1 = "mdp", mdp2 = "passConf") {
    if (document.getElementById(mdp1).value !== document.getElementById(mdp2).value) {
        alert("Formulaire invalide : le mot de passe ne correspond pas");
        return false;
    }
    return true;
}

function checkMail(mail = "mail") {
    re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
    email = document.getElementById(mail).value
    if (email.match(re) === null) {
        alert("l'adresse mail saisie n'est pas valide");
        return false;
    }
    return true;
}

function ChangeMDPShow() {
    document.getElementById('Changemdp').type = 'password';
    document.getElementById('ChangepassConf').type = 'password';
    document.getElementById('changeMDP').onclick = () => {
        ChangeMDPHidden();
    };
    document.getElementById('bMod').style.display = 'block'
    if (document.getElementById('Changemail').type === "hidden") {
        document.getElementById('modifProfile').onsubmit = () => {
            return checkMDP('Changemdp', 'ChangepassConf');
        };
    } else {
        document.getElementById('modifProfile').onsubmit = () => {
            return checkForm('Changemdp', 'ChangepassConf', 'Changemail');
        };
    }
}

function ChangeMailShow() {
    document.getElementById('Changemail').type = 'email';
    document.getElementById('changeMail').onclick = () => {
        changeMailHiddenInter();
    };
    if (document.getElementById('Changemdp').type === "hidden") {
        document.getElementById('modifProfile').onsubmit = () => {
            return checkMail('Changemail');
        };
    } else {
        document.getElementById('modifProfile').onsubmit = () => {
            return checkForm('Changemdp', 'ChangepassConf', 'Changemail');
        };
    }
    document.getElementById('bMod').style.display = 'block'
}

function ChangeMailHidden(mail) {
    document.getElementById('Changemail').type = 'hidden';
    document.getElementById('changeMail').onclick = () => {
        ChangeMailShow();
    };
    if (document.getElementById('Changemdp').type === "hidden") {
        document.getElementById('bMod').style.display = 'none';
        document.getElementById('modifProfile').onsubmit = "";
    } else {
        document.getElementById('modifProfile').onsubmit = () => {
            return checkMDP('Changemdp', 'ChangepassConf');
        }
    }
    document.getElementById('Changemail').value = mail;
}



function ChangeMDPHidden() {
    document.getElementById('Changemdp').type = 'hidden';
    document.getElementById('ChangepassConf').type = 'hidden';
    document.getElementById('changeMDP').onclick = () => {
        ChangeMDPShow();
    };
    if (document.getElementById('Changemail').type === "hidden") {
        document.getElementById('bMod').style.display = 'none'
        document.getElementById('modifProfile').onsubmit = "";
    } else {
        document.getElementById('modifProfile').onsubmit = () => {
            return checkMail('Changemail');
        }
    }
    document.getElementById('Changemdp').value = "";
    document.getElementById('ChangepassConf').value = "";
}


function inscriptionClose() {
    modal.style.display = "none";
    inscriptionHidden();
}

function mdpForgetShow() {
    inscriptionHidden();
    // console.log("test");
    document.getElementById('user').type = 'hidden';
    document.getElementById('mdp').type = 'hidden';
    document.getElementById('mail').type = 'email';
    document.getElementById("titleCo").textContent = "Entrez votre adresse mail";
    document.getElementById("buttCo").textContent = "Envoyer";
    document.getElementById("mdpForget").textContent = "Connexion";
    document.getElementById('mdpForget').onclick = () => {
        inscriptionHidden();
    };
    document.getElementById('formulaire').action = '../connexion/traitement/mdpForget.php';
    document.getElementById("pasInscrit").textContent = "";
}

function inscriptionShow() {
    inscriptionHidden();
    document.getElementById('passConf').type = 'password';
    document.getElementById('nom').type = 'text';
    document.getElementById('prenom').type = 'text';
    document.getElementById('mail').type = 'email';
    document.getElementById('formulaire').onsubmit = () => {
        return checkForm();
    };
    document.getElementById('formulaire').action = '../connexion/traitement/enregistrement.php';
    document.getElementById("titleCo").textContent = "Inscrivez-vous";
    document.getElementById("buttCo").textContent = "S'incrire";
    document.getElementById("pasInscrit").textContent = "Connexion";
    document.getElementById('pasInscrit').onclick = () => {
        inscriptionHidden();
    };
    document.getElementById("mdpForget").textContent = "";
}

function inscriptionHidden() {
    document.getElementById('user').type = 'text';
    document.getElementById('mdp').type = 'password';
    document.getElementById('passConf').type = 'hidden';
    document.getElementById('nom').type = 'hidden';
    document.getElementById('prenom').type = 'hidden';
    document.getElementById('mail').type = 'hidden';
    document.getElementById('formulaire').action = '../connexion/traitement/authentification.php';
    document.getElementById('formulaire').onsubmit = "null";
    document.getElementById("titleCo").textContent = "Connectez-vous";
    document.getElementById("buttCo").textContent = "Se connecter";
    document.getElementById("pasInscrit").textContent = "Pas inscrit ?";
    document.getElementById('pasInscrit').onclick = () => {
        inscriptionShow();
    };
    document.getElementById("mdpForget").textContent = "Mot de passe oublié ?";
    document.getElementById('mdpForget').onclick = () => {
        mdpForgetShow();
    };
}