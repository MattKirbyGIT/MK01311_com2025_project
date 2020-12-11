// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

//Function to obtain a numerical value from any string passed into it.
//Used for determining which cell has been clicked on in a grid of items.
grab_id_val = (id) =>{
    return id.replace(/\D/g,'');
}

//Function to toggle an expanded info view of a cell.
//Param show: boolean value to either show or hide expanded content.
//Param id: Id of button.
//Param expand_id: Id of div to show or hide. 
toggleExpand = (show,id,expand_id) => { 
    cell_id = grab_id_val(id);
    if(show){
        $("#" + expand_id + "-"+cell_id).fadeIn(200);
        dateCheck();
     } else {
        $("#" + expand_id + "-"+cell_id).fadeOut(200);
     }
     return false;         
}