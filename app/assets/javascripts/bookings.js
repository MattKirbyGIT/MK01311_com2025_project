// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


document.addEventListener("DOMContentLoaded", function(event) { 
    handleOptions();
  
});

function handleOptions(){
    var field = document.getElementById("seats-amount")
    for(let i = 1; i <= 20; i++){
        var option = document.createElement('option');
        option.className = "input-option";
        option.value = i;
        if(i === 1){
            option.innerHTML = i + " Seat";
        } else {
            option.innerHTML = i + " Seats";
        }
        
        field.appendChild(option);
    }
}

function toggleSeatSelector(show){
    if(show){
        $("#seat-selector").fadeIn(200);
    } else {
        $("#seat-selector").fadeOut(200);
    }
}

function handleSeats(){

}