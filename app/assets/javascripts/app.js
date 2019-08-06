var listElement = null;

function showListTests(){
    alimentarConsts();
    listElement.classList.remove("hidden");
}

function showAnalisysTest(){
    alimentarConsts();
    listElement.classList.add("hidden");
}

function showGroups(){
    alimentarConsts();
    listElement.classList.add("hidden");
}

function alimentarConsts(){
    listElement = document.getElementById('normal_list');
}