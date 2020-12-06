// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.





function cellFade(fade, ignored_cell){
    document.querySelectorAll(".grid-cell").forEach(cell =>{
        if(fade){
            if(cell.id != ignored_cell){
                cell.style.opacity = 0.4;
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
      if(date > Date.now() && !element.className.includes(" unreleased")){
          let node = document.createElement("div");
          node.className = "badge badge-warning mb-2";
          node.style.fontSize = "2em"
          node.style.width = "100%"
          node.innerHTML = "Coming Soon!";
          document.getElementById("book-" + cell_id).before(node);
          document.getElementById("book-" + cell_id).style.display = "none"
          element.className += " unreleased"

      }
    
    });
}

