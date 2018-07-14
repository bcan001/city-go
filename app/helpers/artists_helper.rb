module ArtistsHelper

	def fetch_spotify_image(attrs)
		begin
			RSpotify.authenticate(ENV["CLIENT_ID"],ENV["CLIENT_SECRET"])
			artist = RSpotify::Artist.search(attrs[:artist_name])
			return artist[0].images[0]['url']
		rescue
			if attrs[:type] == 'event'
				# return '/assets/event_banner.png'
				return 'event-image'
			elsif attrs[:type] == 'artist'
				# return '/assets/artist_profile.png'
				return 'artist-profile'
			end
			
		end
	end

	# def fetch_artist_image(attrs)
	# 	'artist-profile-small'
	# end

	 # [#<RSpotify::Artist:0x00007ff530ca5ee0
 #  @external_urls={"spotify"=>"https://open.spotify.com/artist/0Y0QSi6lz1bPik5Ffjr8sd"},
 #  @followers={"href"=>nil, "total"=>37916},
 #  @genres=["bass trap", "brostep", "edm", "electro house", "electronic trap", "moombahton", "vapor twitch"],
 #  @href="https://api.spotify.com/v1/artists/0Y0QSi6lz1bPik5Ffjr8sd",
 #  @id="0Y0QSi6lz1bPik5Ffjr8sd",
 #  @images=
 #   [{"height"=>640, "url"=>"https://i.scdn.co/image/1aab1fe3ced941849a9cece2acbb28472eab23a8", "width"=>640},
 #    {"height"=>320, "url"=>"https://i.scdn.co/image/94de60e93b3f4e47abbd0fe6f6c90ba8f572bd22", "width"=>320},
 #    {"height"=>160, "url"=>"https://i.scdn.co/image/a2c31ba62db794a2bfba869413c4b9b7f1d9bc3f", "width"=>160}],
 #  @name="Ekali",
 #  @popularity=55,
 #  @top_tracks={},
 #  @type="artist",
 #  @uri="spotify:artist:0Y0QSi6lz1bPik5Ffjr8sd">]





end