// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.



$(document).ready(function(){
    // Handler when all assets are loaded
  
    dateCheck();
  });


function toggleExpand(show,id){ 
    if(show){
        var cell_id = id.replace("grid-thumb-","") 
        $("#grid-expand-"+cell_id).fadeIn(200);
     } else {
        var cell_id = id.replace("grid-close-","") 
        $("#grid-expand-"+cell_id).fadeOut(200);
     }
            
}

function cellFade(fade, ignored_cell){
    document.querySelectorAll(".film-item").forEach(cell =>{
        if(fade){
            if(cell.id != ignored_cell){
                cell.style.opacity = 0.2;
            }
        } else {
            cell.style.opacity = 1;
        }
        
    });
}

function dateCheck(){
    document.querySelectorAll(".film-date").forEach(element =>{
      const date = Date.parse(element.innerHTML)
      const cell_id = element.id.replace("film-date-","");
      if(date > Date.now()){
          let node = document.createElement("div");
          node.className = "badge badge-warning mb-2";
          node.style.fontSize = "2em"
          node.style.width = "100%"
          node.innerHTML = "Coming Soon!";
          document.getElementById("book-" + cell_id).before(node);
          document.getElementById("book-" + cell_id).style.display = "none"
      }

    });
}

