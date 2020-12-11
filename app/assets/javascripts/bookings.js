// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


//Method to populate the select field in the from with 20 html option elements.
handleOptions = () => {
    var field = document.getElementById("seats-amount")
    for(let i = 1; i <= 20; i++){
        var option = document.createElement('option'); //Create 20 option elements
        option.className = "input-option";
        option.value = i;
        if(i === 1){
            option.innerHTML = i + " Seat"; 
        } else {
            option.innerHTML = i + " Seats";
        }
        
        field.appendChild(option); //Append each option to the select field.
    }
}

//Method to toggle the seat seletor panel in the form.
//Param: show - boolean, true in order to show the field.
toggleSeatSelector = (show) => {
    handleSeatCounter()
    if(show){
        $("#seat-selector").fadeIn(200); //jQuery animations to toggle display property (transition: 200ms)
    } else {
        $("#seat-selector").fadeOut(200);
    }
    return false;
}

//Array to store all selected seats.
var seats = []; 

//Method called when a user selects an seat in the seat selector.
//Param: seat: value of seat in row selected
//Param: row: value of the row selected
seatSelect = (seat, row) =>{
    $('#seat'+seat+'row'+row).attr('disabled', true); //Disables button whilst method rubs.
  
    var selectedSeat = [seat,row];
    if(!JSON.stringify(seats).includes(JSON.stringify(selectedSeat))){ // checks if seat selected in in seats array
        if(seats.length < getSelectedSeats() ) { //Adds seat to array if number os seats to select is not 0.
            seats.push(selectedSeat) 
            document.getElementById('seat'+seat+'row'+row).classList.add("seat-select")
        }   
    } else {  //If seat already in array, remove it from array to deselect seat.
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

//Method to create an AJAX request to the booking method.
//AJAX Request sends the booking form data /book controller action, along with all seats selected.
bookingFormSubmit = () => { 
    $("#booking-form").submit(function(e){
        e.preventDefault(); //Stop default page propigation.
           if(seats.length < getSelectedSeats()){ //If not all seats selected, produce error.
            setErrorMessage(getSelectedSeats() - seats.length + " seats remaining to select!");
           } else {
            $.ajax({ //AJAX Request using post to the booking action
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

//Method to obtain the value selected in the select html field
getSelectedSeats = () => {
    var seats_amount_select = document.getElementById("seats-amount");
    //obtain value from option select field.
    var seats_amount_opt = seats_amount_select.options[seats_amount_select.selectedIndex].value 
    return seats_amount_opt;
}

//Method to update the counter to tell the user how my seats they have left to select.
handleSeatCounter = () => {
    var total = getSelectedSeats(); //Gets number of seats to be selected
    var remaining = total - seats.length; //seats remaining is amount select minus length of seats array
    var counter = document.getElementById("seat-counter");
    if(remaining == 0){
        counter.innerHTML = "No seats remaining!"
        counter.classList.add("text-info");
    } else {
        counter.innerHTML = remaining;
        counter.classList.remove("text-info");  
    }
}

//Method to paste the E-ticket code to the users system clipboard
handleClipboard = () => {
    var tempInput = document.createElement("input");  
    tempInput.value = document.getElementById("e-ticket-code").innerHTML
    console.log(tempInput.value)
    document.body.appendChild(tempInput);
    tempInput.select();
    document.execCommand("copy")
    tempInput.style.visibility = "hidden";
    document.body.removeChild(tempInput);
}

//Method to set an erro message for the seat selector form field. 
setErrorMessage = (msg) => {
    document.getElementById("seat-error").innerHTML = msg;
}



