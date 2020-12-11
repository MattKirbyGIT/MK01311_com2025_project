// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

//Message to show or not show the showing popout. (For the shoiwing times)
//Params: id- id of the showing to have info dusplaye about it.
//Params: popount - boolean, show or hide the popout.
popoutToggle = (id,popout) =>{
    var cell_id = grab_id_val(id);
    if(popout){
        $("#popout-" + cell_id).fadeIn(200);
    } else { 
        $("#popout-" + cell_id).fadeOut(200);
    }
}

//toggle the seat position grid overview
//Params: id: Id of showing to showthe seat grid partial for.
overviewToggle = (id) =>{ 
    var cell_id = grab_id_val(id);
    var panel = document.getElementById("seat-grid-mini-" + cell_id)  
    if(panel.style.maxHeight === "0px"){
        panel.style.maxHeight = "500px"
    } else {
        panel.style.maxHeight = "0px"
    }
}