// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


$(document).ready(function(){
    // Handler when all assets are loaded
   gridEventHandlers();
    
  });


function gridEventHandlers(){
    document.querySelectorAll(".film-read-more").forEach(element =>{
        element.addEventListener('click', event =>{  
        var cellID = event.target.id.replace("expand-","") 
        $("#grid-expand-"+cellID).fadeToggle(200);
        })
    });

    document.querySelectorAll(".expand-overlay").forEach(element =>{
        element.addEventListener('click', event =>{  
        var cellID = event.target.id.replace("expand-overlay-","") 
        $("#grid-expand-"+cellID).fadeToggle(200);
        })
    });


}

