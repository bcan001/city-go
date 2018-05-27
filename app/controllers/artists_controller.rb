class ArtistsController < ApplicationController

	def index
		
		# for getting images:

		# RSpotify.authenticate("", "")
		# artists = RSpotify::Artist.search('Arctic Monkeys')
		# binding.pry


		# Now you can access playlists in detail, browse featured content and more
		# me = RSpotify::User.find('guilhermesad')

		

	end

	def show
	end

	def new
	end

	def create
	end

	def edit
	end

	def update
	end

	def destroy
	end

end





#  pry(#<ArtistsController>)> RSpotify::Artist.search('Arctic Monkeys')
# => [#<RSpotify::Artist:0x00007fdce71c7f70
#   @external_urls={"spotify"=>"https://open.spotify.com/artist/7Ln80lUS6He07XvHI8qqHH"},
#   @followers={"href"=>nil, "total"=>5724461},
#   @genres=["garage rock", "modern rock", "permanent wave", "sheffield indie"],
#   @href="https://api.spotify.com/v1/artists/7Ln80lUS6He07XvHI8qqHH",
#   @id="7Ln80lUS6He07XvHI8qqHH",
#   @images=
#    [{"height"=>640, "url"=>"https://i.scdn.co/image/ed0552e9746ed2bbf04ae4bcb5525700ca31522d", "width"=>640},
#     {"height"=>320, "url"=>"https://i.scdn.co/image/b435e99aa7f1e27db56b6a4dc9df85e5636b22d6", "width"=>320},
#     {"height"=>160, "url"=>"https://i.scdn.co/image/73c4e49abed008fe0c5e4f1437b8b486c7670ecd", "width"=>160}],
#   @name="Arctic Monkeys",
#   @popularity=87,
#   @top_tracks={},
#   @type="artist",
#   @uri="spotify:artist:7Ln80lUS6He07XvHI8qqHH">,
#  #<RSpotify::Artist:0x00007fdce71c7f20
#   @external_urls={"spotify"=>"https://open.spotify.com/artist/2hv9oBOxgWSFnZJPW6UL58"},
#   @followers={"href"=>nil, "total"=>107},
#   @genres=[],
#   @href="https://api.spotify.com/v1/artists/2hv9oBOxgWSFnZJPW6UL58",
#   @id="2hv9oBOxgWSFnZJPW6UL58",
#   @images=
#    [{"height"=>640, "url"=>"https://i.scdn.co/image/6ae606d02a9a1b9541755a79b2332dbbf136dcac", "width"=>640},
#     {"height"=>300, "url"=>"https://i.scdn.co/image/1952a2eeadd7b6eab4db63b27f7df0c984b72d8b", "width"=>300},
#     {"height"=>64, "url"=>"https://i.scdn.co/image/71d01b4ba80afb2787f6fe2ca56fdb7d41b15664", "width"=>64}],
#   @name="Arctic Monkeys Tribute Band",
#   @popularity=4,
#   @top_tracks={},
#   @type="artist",
#   @uri="spotify:artist:2hv9oBOxgWSFnZJPW6UL58">]

















