user = User.create(username: 'bencaneba', password: 'password', first_name: 'Ben', last_name: 'Caneba', email: 'bcaneba@gmail.com', phone: '9062314010')

artist = Artist.create(name: 'Ekali', description: 'Electronic Music producer from Vancouver,CA who plays everything from heavy trap to future bass music.')
city = City.create(name: 'Chicago', state: 'IL', zip: '60622')
venue = city.venues.build(name: 'Concord Music Hall', description: 'Large music hall that hosts a diverse variety of music shows', address: '2047 N Milwaukee Ave')
venue.save

# binding.pry

8.times do
	event = venue.events.build(
		event_date: Time.now.to_datetime,
		title: 'Ekali World Tour',
		description: 'Ekali stops in Chicago as part of his world tour.',
		city_id: city.id,
		artist_id: artist.id
	)
	event.save

	# votes
	vote_event = user.votes.build(vote_type: 'event', vote_id: event.id)
	vote_event.save
	vote_artist = user.votes.build(vote_type: 'artist', vote_id: artist.id)
	vote_artist.save
end

# user_favorites for the user
user_favorite_event = user.user_favorites.build(favorite_type: 'event', favorite_id: 1)
user_favorite_event.save
user_favorite_city = user.user_favorites.build(favorite_type: 'city', favorite_id: city.id)
user_favorite_city.save
user_favorite_venue = user.user_favorites.build(favorite_type: 'venue', favorite_id: venue.id)
user_favorite_venue.save


# links (belongs to one artist. social media links for artists- spotify, website, twitter, facebook, EMBED YOUTUBE LINK FOR PLAYING THEIR MUSIC)

link_spotify = artist.links.build(link_type: 'spotify', url: 'www.spotify.com/ekali')
link_spotify.save
link_website = artist.links.build(link_type: 'website', url: 'www.website.com/ekali')
link_website.save
link_twitter = artist.links.build(link_type: 'twitter', url: 'www.twitter.com/ekali')
link_twitter.save
link_facebook = artist.links.build(link_type: 'facebook', url: 'www.facebook.com/ekali')
link_facebook.save
link_youtube = artist.links.build(link_type: 'youtube', url: 'www.youtube.com/ekali')
link_youtube.save
















