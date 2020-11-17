# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


@films = Film.create([{
    title: 'The Kings Man', 
    description: 'When a group of villains devises a plot to kill millions around the world, a nobleman and his protégée must step up to stop them. Gemma Arterton, Ralph Fiennes and Harris Dickinson star in this action-packed prequel to the acclaimed Kingsman film series.', 
    release_date: Date.parse('12th Feb 2021'), 
    running_time_mins: 187, 
    minimum_age_restriction: 16,
    rating: 4.2, 
    image_url: 'https://images.mymovies.net/images/film/cin/350x522/fid19715.jpg'},
{
    title: 'No Time To Die', 
    description: 'Retirement doesn’t suit James Bond. When an old friend turns up to his Jamaican retreat in need of help, the spy is taken on a mission far more treacherous than even he could have expected. Léa Seydoux, Daniel Craig, Ralph Fiennes and Rami Malek star in the 25th film in the Bond series.', 
    release_date: Date.parse('2nd Apr 2021'), 
    running_time_mins: 183, 
    minimum_age_restriction: 16,
    rating: 4.5, 
    image_url: 'https://images.mymovies.net/images/film/cin/350x522/fid19804.jpg'

},{
    title: 'Tenet', 
    description: 'Armed with only one word—Tenet—and fighting for the survival of the entire world, the Protagonist journeys through a twilight world of international espionage on a mission that will unfold in something beyond real time.', 
    release_date: Date.parse('2nd Apr 2021'), 
    running_time_mins: 191, 
    minimum_age_restriction: 12,
    rating: 4.9, 
    image_url: 'https://images.mymovies.net/images/film/cin/350x522/fid20066.jpg'

},{
    title: 'AVENGERS: ENDGAME', 
    description: 'The grave course of events set in motion by Thanos that wiped out half the universe and fractured the Avengers ranks compels the remaining Avengers to take one final stand in Marvel Studios grand conclusion to twenty-two films, "Avengers: Endgame."', 
    release_date: Date.parse('25th Apr 2019'), 
    running_time_mins: 191, 
    minimum_age_restriction: 12,
    rating: 4.5, 
    image_url: 'https://images.mymovies.net/images/film/cin/350x522/fid19129.jpg'

},{
    title: 'STAR WARS: The Rise of Skywalker', 
    description: "J.J. Abrams directs, produces, and co-writes this thrilling conclusion to the saga, starring Daisy Ridley, Adam Driver, Oscar Isaac and John Boyega. Rey's journey continues and the Skywalker saga concludes in 'Star Wars: The Rise Of Skywalker', coming December 2019. No one's ever really gone...", 
    release_date: Date.parse('19th Dec 2019'), 
    running_time_mins: 144, 
    minimum_age_restriction: 12,
    rating: 3.4, 
    image_url: 'https://images.mymovies.net/images/film/cin/350x522/fid19446.jpg'

},{
    title: 'Knives Out', 
    description: "When a family gathering goes horribly wrong, three detectives are sent to unravel the puzzling mystery behind the death of one of the guests. Rian Johnson directs Chris Evans, Daniel Craig, and LaKeith Stanfield, who star in this modern murder mystery that will keep you guessing throughout.", 
    release_date: Date.parse('27th Nov 2019'), 
    running_time_mins: 130, 
    minimum_age_restriction: 12,
    rating: 5, 
    image_url: 'https://images.mymovies.net/images/film/cin/350x522/fid19692.jpg'
}])

@venues = Venue.create([{
    name: "CineView Piccadilly", 
    location: "19 Lower, Regent St, London SW1Y 4LR",
    rows: 16, 
    seats_per_row: 16 
},{
    name: "CineView West End", 
    location: "Square, 3 Cranbourn Street Leicester, London WC2H 7AL",
    rows: 16, 
    seats_per_row: 12 
},{
    name: "CineView Westfield", 
    location: "Montfichet Rd, London E20 1EJ",
    rows: 10, 
    seats_per_row: 12 
 }
])

@showings = Showing.create([{
    film_id: 3,
    venue_id: 1,
    time: "10:00:00"
},{
    film_id: 3,
    venue_id: 1,
    time: "13:00:00"
},{
    film_id: 4,
    venue_id: 1,
    time: "16:00:00"
},{
    film_id: 5,
    venue_id: 1,
    time: "19:00:00"
},{
    film_id: 4,
    venue_id: 2,
    time: "10:00:00"
},{
    film_id: 4,
    venue_id: 2,
    time: "13:00:00"
},{
    film_id: 5,
    venue_id: 2,
    time: "16:00:00"
},{
    film_id: 6,
    venue_id: 2,
    time: "19:00:00"
},{
    film_id: 5,
    venue_id: 3,
    time: "10:00:00"
},{
    film_id: 5,
    venue_id: 3,
    time: "13:00:00"
},{
    film_id: 6,
    venue_id: 3,
    time: "16:00:00"
},{
    film_id: 4,
    venue_id: 3,
    time: "19:00:00"
}
])

