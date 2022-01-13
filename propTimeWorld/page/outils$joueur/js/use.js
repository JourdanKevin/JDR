let actualMenue = "";
let actualAtif = "";
let compteurTR = 0;
function ChangeMenue(menue,title,idA){
    if (actualMenue !== menue){
        $(actualAtif).removeClass('active');        
        $(idA).addClass("active");
        $('#title').fadeOut(150,()=>{
            $('#title').text(title);
        });         
        $("#title").fadeIn(200);
        if (actualMenue === ""){
            $(menue).fadeIn(750);
        }
        else{$(actualMenue).fadeOut(200,()=>{   
            $(menue).fadeIn(200);
        });}        
        actualMenue = menue
        actualAtif = idA
    }
  }
$(document).ready(()=>{
    $("#création_de_personnage").click(()=>{
        ChangeMenue("#perso","Création de personnage","#création_de_personnage");
    });
    $("#liste_de_sorts").click(()=>{
        ChangeMenue("#spell","Liste des sorts", "#liste_de_sorts");
  });
})

function AddInput(NameParent){
    var input = document.createElement("INPUT");
    input.setAttribute("type", "text");
    var parent = document.getElementById(NameParent);
    parent.appendChild(input);
}
function AddTD(NameID){
    var TD = document.createElement("TD");
    TD.setAttribute("id", NameID);
    var parent = document.getElementById(compteurTR);
    parent.appendChild(TD);
}
function AddTR(NameID){
    var TR = document.createElement("TR");
    TR.setAttribute("id", NameID);
    var parent = document.getElementById("bodySpell");
    parent.appendChild(TR);
}
function AddSpell(){
    AddTR(compteurTR);
    var list = ["NomSpell"+compteurTR.toString(),"DescriptionSpell"+compteurTR.toString(),"CoutSpell"+compteurTR.toString(),"ValeurSpell"+compteurTR.toString(),"RangSpell"+compteurTR.toString(),"MaxSpell"+compteurTR.toString(),"NbSpell"+compteurTR.toString(),"StatSpell"+compteurTR.toString()];
    list.forEach(element => {
        AddTD(element);
        AddInput(element);
    });
    compteurTR++;


}

