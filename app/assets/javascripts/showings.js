// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function venue_select(venue_id, film_id){
    $.ajax({
        url: "/showingTimes",
        data: {
            venue_id: venue_id,
            film_id: film_id
        },
        type: "get"
    })
}