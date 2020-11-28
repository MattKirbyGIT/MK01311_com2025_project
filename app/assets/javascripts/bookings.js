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
    handleSeatCounter()
    if(show){
        $("#seat-selector").fadeIn(200);
    } else {
        $("#seat-selector").fadeOut(200);
    }
    return false;
}

var seats = [];

function seatSelect(seat, row){
    $('#seat'+seat+'row'+row).attr('disabled', true);
  
    var selectedSeat = [seat,row];
    if(!JSON.stringify(seats).includes(JSON.stringify(selectedSeat))){
        if(seats.length < getSelectedSeats() ) {
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
    handleSeatCounter() 
    $('#seat'+seat+'row'+row).attr('enabled', true);
}


function bookingFormSubmit(){ 
    $("#booking-form").submit(function(e){
        e.preventDefault();
           if(seats.length < getSelectedSeats()){
            setErrorMessage(getSelectedSeats() - seats.length + " seats remaining to select!");
           } else {
            $.ajax({
                url: "/book",
                data: {
                   booking: $("#booking-form").serializeArray(),
                   seatPosArray: seats,      
                },
                type: "post"
            })
           }        
     });  
}

function getSelectedSeats(){
    var seats_amount_select = document.getElementById("seats-amount");
    var seats_amount_opt = seats_amount_select.options[seats_amount_select.selectedIndex].value
    return seats_amount_opt;
}

function handleSeatCounter(){
    var total = getSelectedSeats();
    var remaining = total - seats.length;
    var counter = document.getElementById("seat-counter");
    if(remaining == 0){
        counter.innerHTML = "No seats remaining!"
        counter.classList.add("text-info");
    } else {
        counter.innerHTML = remaining;
        counter.classList.remove("text-info");  
    }
}

function handleClipboard(){
    var tempInput = document.createElement("input");  
    tempInput.value = document.getElementById("e-ticket-code").innerHTML
    console.log(tempInput.value)
    document.body.appendChild(tempInput);
    tempInput.select();
    document.execCommand("copy")
    tempInput.style.visibility = "hidden";
    document.body.removeChild(tempInput);
}

function setErrorMessage(msg){
    document.getElementById("seat-error").innerHTML = msg;
}



