// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

//Handles the fading of all but the selected cell
//Params: Fade - boolean, true if fade required.
//Params: Ignored_cell - String id of the cell that should not be faded.
cellFade = (fade, ignored_cell) => {
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

//Checks release date of a film. If the release date is greater tha n the current date, show a "unreleased" message.
dateCheck = () => {
    document.querySelectorAll(".film-date").forEach(element =>{
      const date = Date.parse(element.innerHTML)
      const cell_id = element.id.replace("film-date-","");
      if(date > Date.now() && !element.className.includes(" unreleased")){ //Checks if date greater than now
          let node = document.createElement("div"); //Create message element
          node.className = "badge badge-warning mb-2";
          node.style.fontSize = "2em"
          node.style.width = "100%"
          node.innerHTML = "Coming Soon!";
          document.getElementById("book-" + cell_id).before(node); //append message element to expand content.
          document.getElementById("book-" + cell_id).style.display = "none"
          element.className += " unreleased"

      }
    
    });
}

