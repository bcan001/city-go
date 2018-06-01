user = User.create(username: 'bencaneba', password: 'password', first_name: 'Ben', last_name: 'Caneba', email: 'bcaneba@gmail.com', phone: '9062314010')

artist = Artist.create(name: 'Ekali', description: 'Electronic Music producer from Vancouver,CA who plays everything from heavy trap to future bass music.')
artist2 = Artist.create(name: 'Anderson Paak', description: 'Brandon Paak Anderson, better known by his stage name Anderson Paak, is an American rapper, songwriter, drummer, singer and record producer from Oxnard, California.')
artist3 = Artist.create(name: 'THE FREE NATIONALS', description: "Anderson .Paak's backing band consisting of Jose Rios, Ron Tnava Avant, Kelsey Gonzales, and Callum Connor.")


city = City.create(name: 'Chicago', state: 'IL', zip: '60622')

venue = city.venues.build(name: 'Concord Music Hall', description: 'Large music hall that hosts a diverse variety of music shows', address: '2047 N Milwaukee Ave')
venue.save

venue2 = city.venues.build(name: 'Soundbar', description: 'Large music hall that hosts a diverse variety of music shows', address: '2047 N Milwaukee Ave')
venue2.save

venue3 = city.venues.build(name: 'The Metro', description: 'Large music hall that hosts a diverse variety of music shows', address: '2047 N Milwaukee Ave')
venue3.save

venue4 = city.venues.build(name: 'Lincoln Hall', description: 'Large music hall that hosts a diverse variety of music shows', address: '2047 N Milwaukee Ave')
venue4.save



8.times do
	event = venue.events.build(
		event_date: Time.now.to_datetime,
		title: 'Ekali World Tour',
		description: 'Ekali stops in Chicago as part of his world tour.',
		city_id: city.id,
	)
	event.save

	EventRelationship.create(event_id: event.id, artist_id: artist.id)

	# votes
	vote_event = user.votes.build(vote_type: 'event', vote_id: event.id)
	vote_event.save
	vote_artist = user.votes.build(vote_type: 'artist', vote_id: artist.id)
	vote_artist.save
end

5.times do
	event = venue.events.build(
		event_date: Time.now.to_datetime + 1,
		title: 'Anderson Paak and the FREE NATIONALS',
		description: 'Anderson Paak and group THE FREE NATIONALS play in Chicago!',
		city_id: city.id,
	)
	event.save

	EventRelationship.create(event_id: event.id, artist_id: artist2.id)
	EventRelationship.create(event_id: event.id, artist_id: artist3.id)

end

# features
Feature.create(feature_type: 'Event', feature_id: 1)
Feature.create(feature_type: 'Event', feature_id: 2)
Feature.create(feature_type: 'Event', feature_id: 3)
Feature.create(feature_type: 'Event', feature_id: 4)
Feature.create(feature_type: 'Venue', feature_id: 1)
Feature.create(feature_type: 'Venue', feature_id: 2)
Feature.create(feature_type: 'Venue', feature_id: 3)
Feature.create(feature_type: 'Venue', feature_id: 4)



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
















