// function include(file) {
//     var script = document.createElement('script');
//     script.src = file;
//     script.type = 'text/javascript';
//     script.defer = true;
//     document.getElementsByTagName('head').item(0).appendChild(script);
// }
// include("../../../../commun/function/tools");
// include("../../../commun/function/tools.js");

function checkForm() {
    if (document.getElementById("mdp").value == document.getElementById("passConf").value) {
        return true;
    } else {
        alert("Formulaire invalide : le mot de passe ne correspond pas");
        return false;
    }
}