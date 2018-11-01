require_relative('./models/movie')
require_relative('./models/star')
require_relative('./models/casting')
require('pp')

Star.delete_all
Movie.delete_all
Casting.delete_all

star1 = Star.new({'first_name' => 'Natalie', 'last_name' => 'Portman'})
star1.save
star2 = Star.new({'first_name' => 'Dwayne', 'last_name' => 'Johnson'})
star2.save
star3 = Star.new({'first_name' => 'Gary', 'last_name' => 'Oldman'})
star3.save

movie1 = Movie.new({'title' => 'Leon', 'genre' => 'Action'})
movie1.save
movie2 = Movie.new({'title' => 'Baywatch', 'genre' => 'Comedy'})
movie2.save
movie3 = Movie.new({'title' => 'Phantom Menace', 'genre' => 'sci-fi'})
movie3.save


casting1 = Casting.new({
    'movie_id' => movie1.id,
    'star_id' => star1.id,
    'fee' => '50000'
})
casting1.save

casting2 = Casting.new({
    'movie_id' => movie3.id,
    'star_id' => star1.id,
    'fee' => '500000'
})
casting2.save

casting2 = Casting.new({
    'movie_id' => movie1.id,
    'star_id' => star3.id,
    'fee' => '100000'
})
casting2.save

pp movie1.stars
