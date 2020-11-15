# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Film.create([{
    title: 'The Kings Man', 
    description: 'When a group of villains devises a plot to kill millions around the world, a nobleman and his protégée must step up to stop them. Gemma Arterton, Ralph Fiennes and Harris Dickinson star in this action-packed prequel to the acclaimed Kingsman film series.', 
    release_date: Date.parse('12th Feb 2021'), 
    running_time_mins: 187, 
    minimum_age_restriction: 16,
    rating: 4.2, 
    image_url: 'https://images.mymovies.net/images/film/cin/350x522/fid19715.jpg'},
{
    title: 'NO TIME TO DIE', 
    description: 'Retirement doesn’t suit James Bond. When an old friend turns up to his Jamaican retreat in need of help, the spy is taken on a mission far more treacherous than even he could have expected. Léa Seydoux, Daniel Craig, Ralph Fiennes and Rami Malek star in the 25th film in the Bond series.', 
    release_date: Date.parse('2nd Apr 2021'), 
    running_time_mins: 183, 
    minimum_age_restriction: 16,
    rating: 4.5, 
    image_url: 'https://images.mymovies.net/images/film/cin/350x522/fid19804.jpg'

},
    title: 'Tenet', 
    description: 'Armed with only one word—Tenet—and fighting for the survival of the entire world, the Protagonist journeys through a twilight world of international espionage on a mission that will unfold in something beyond real time.', 
    release_date: Date.parse('2nd Apr 2021'), 
    running_time_mins: 191, 
    minimum_age_restriction: 12,
    rating: 4.9, 
    image_url: 'https://m2.odeon.co.uk/_uploads/asset_management/220x320_a5cdedb42775cbd6f8ad6ff24633dc45.jpg'
])

@showing = Showing.create(film_id: 1, venue: "MyString 2", date: Date.parse('2nd Apr 2021'), time: "14:33:43", rows: 10, seats_per_row: 10)
