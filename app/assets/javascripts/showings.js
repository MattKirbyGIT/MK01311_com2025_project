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