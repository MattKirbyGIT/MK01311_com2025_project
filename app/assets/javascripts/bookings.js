// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.



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

var seats = [];

function seatSelect(seat, row){
   var seats_amount_select = document.getElementById("seats-amount");
   var seats_amount_opt = seats_amount_select.options[seats_amount_select.selectedIndex].value
   var selectedSeat = [seat,row];

   if(!JSON.stringify(seats).includes(JSON.stringify(selectedSeat))){
        if(seats.length < seats_amount_opt ) {
        seats.push(selectedSeat)
        document.getElementById('seat'+seat+'row'+row).classList.add("seat-select")
        }   
    } else { 
        for (var i = 0; i < seats.length; i++){
            if(seats[i][0] === selectedSeat[0] && seats[i][1] === selectedSeat[1]){
                    seats.splice(seats.indexOf(i),1);
                    document.getElementById('seat'+seat+'row'+row).classList.remove("seat-select") 
            }
        }
    }
   console.log(seats) 
}