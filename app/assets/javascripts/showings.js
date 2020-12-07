// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

popoutToggle = (id,popout) =>{
    var cell_id = id.replace(/\D/g,'');
    if(popout){
        $("#popout-" + cell_id).fadeIn(200);
   
    } else {
        
        $("#popout-" + cell_id).fadeOut(200);
    }
}

overviewToggle = (id) =>{ 
    cell_id = grab_id_val(id);
    var panel = document.getElementById("seat-grid-mini-" + cell_id)
   
    if(panel.style.maxHeight === "0px"){
        console.log("test")
        panel.style.maxHeight = "500px"
    } else {
        panel.style.maxHeight = "0px"
    }
}