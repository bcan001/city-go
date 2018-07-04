module EventsHelper

	def fetch_events(artist_name,date)
		unless ENV['SONGKICK_KEY'] == '12345678910'

			require 'songkickr'
			remote = Songkickr::Remote.new(ENV['SONGKICK_KEY'])
			results = remote.events(artist_name: artist_name, type: 'concert').results


			# https://github.com/jrmehle/songkickr
			# binding.pry


			# what do we need:
			results.each do |event|
				@event_date = event.start
				@city = event.location.city
				@venue = event.venue.display_name

				# results = remote.events(artist_name: 'Metallica', type: 'festival') OR CONCERT
				# event.performances.each do |performance|

				# end


			end

		end
	end



end




# ================================================================


# [6] pry(#<EventsController>)> remote.events('Ekali').results.first
# => #<Songkickr::Event:0x00007f9ca5c48738
#  @display_name="Audiotistic 2018",
#  @id=33851344,
#  @location=#<Songkickr::Location:0x00007f9ca5c48710 @city="Mountain View, CA, US", @lat=37.4233243, @lng=-122.0780286>,
#  @performances=
#   [#<Songkickr::Performance:0x00007f9ca5c48238
#     @artist=
#      #<Songkickr::Artist:0x00007f9ca5c48210
#       @display_name="Porter Robinson",
#       @id=3821916,
#       @identifier=
#        [{"href"=>"http://api.songkick.com/api/3.0/artists/mbid:4ae36ade-1798-48c4-b06b-cc68b7d3d83f.json",
#          "mbid"=>"4ae36ade-1798-48c4-b06b-cc68b7d3d83f"}],
#       @on_tour_until=nil,
#       @uri="http://www.songkick.com/artists/3821916-porter-robinson?utm_source=48987&utm_medium=partner">,
#     @billing="headline",
#     @billing_index=1,
#     @display_name="Porter Robinson",
#     @id=65046269>,
#    #<Songkickr::Performance:0x00007f9ca5c481e8
#     @artist=
#      #<Songkickr::Artist:0x00007f9ca5c481c0
#       @display_name="Famous Dex",
#       @id=8843439,
#       @identifier=
#        [{"href"=>"http://api.songkick.com/api/3.0/artists/mbid:c34cfbd6-1df2-4865-96d9-e3bb4fe0577d.json",
#          "mbid"=>"c34cfbd6-1df2-4865-96d9-e3bb4fe0577d"}],
#       @on_tour_until=nil,
#       @uri="http://www.songkick.com/artists/8843439-famous-dex?utm_source=48987&utm_medium=partner">,
#     @billing="headline",
#     @billing_index=2,
#     @display_name="Famous Dex",
#     @id=66069119>,
#    #<Songkickr::Performance:0x00007f9ca5c48198
#     @artist=
#      #<Songkickr::Artist:0x00007f9ca5c48170
#       @display_name="Party Favor",
#       @id=5621563,
#       @identifier=
#        [{"href"=>"http://api.songkick.com/api/3.0/artists/mbid:e2708721-596b-462e-b1b0-8e2d04ea8adb.json",
#          "mbid"=>"e2708721-596b-462e-b1b0-8e2d04ea8adb"},
#         {"href"=>"http://api.songkick.com/api/3.0/artists/mbid:47388143-87f0-45da-9f46-d145feb1626b.json",
#          "mbid"=>"47388143-87f0-45da-9f46-d145feb1626b"}],
#       @on_tour_until=nil,
#       @uri="http://www.songkick.com/artists/5621563-party-favor?utm_source=48987&utm_medium=partner">,
#     @billing="headline",
#     @billing_index=3,
#     @display_name="Party Favor",
#     @id=65447879>,
#    #<Songkickr::Performance:0x00007f9ca5c48148
#     @artist=
#      #<Songkickr::Artist:0x00007f9ca5c48120
#       @display_name="Shiba San",
#       @id=7569989,
#       @identifier=
#        [{"href"=>"http://api.songkick.com/api/3.0/artists/mbid:748e8144-2636-4f9d-b2ae-2d743781376a.json",
#          "mbid"=>"748e8144-2636-4f9d-b2ae-2d743781376a"}],
#       @on_tour_until=nil,
#       @uri="http://www.songkick.com/artists/7569989-shiba-san?utm_source=48987&utm_medium=partner">,
#     @billing="headline",
#     @billing_index=4,
#     @display_name="Shiba San",
#     @id=65045969>,
#    #<Songkickr::Performance:0x00007f9ca5c480f8
#     @artist=
#      #<Songkickr::Artist:0x00007f9ca5c480d0
#       @display_name="Rezz",
#       @id=212986,
#       @identifier=
#        [{"href"=>"http://api.songkick.com/api/3.0/artists/mbid:2eaf4267-4dd6-412a-9bb0-596afb90215b.json",
#          "mbid"=>"2eaf4267-4dd6-412a-9bb0-596afb90215b"}],
#       @on_tour_until=nil,
#       @uri="http://www.songkick.com/artists/212986-rezz?utm_source=48987&utm_medium=partner">,
#     @billing="headline",
#     @billing_index=5,
#     @display_name="Rezz",
#     @id=65753114>,
#    #<Songkickr::Performance:0x00007f9ca5c480a8
#     @artist=
#      #<Songkickr::Artist:0x00007f9ca5c48080
#       @display_name="Ekali",
#       @id=8573814,
#       @identifier=
#        [{"href"=>"http://api.songkick.com/api/3.0/artists/mbid:f62a6ac4-664b-4035-9ab1-0b3ab8e1773e.json",
#          "mbid"=>"f62a6ac4-664b-4035-9ab1-0b3ab8e1773e"}],
#       @on_tour_until=nil,
#       @uri="http://www.songkick.com/artists/8573814-ekali?utm_source=48987&utm_medium=partner">,
#     @billing="headline",
#     @billing_index=6,
#     @display_name="Ekali",
#     @id=65047054>,
#    #<Songkickr::Performance:0x00007f9ca5c48058
#     @artist=
#      #<Songkickr::Artist:0x00007f9ca5c48030
#       @display_name="Phantoms",
#       @id=415077,
#       @identifier=
#        [{"href"=>"http://api.songkick.com/api/3.0/artists/mbid:334f4e2c-9f5e-4de4-adfe-ce609e443057.json",
#          "mbid"=>"334f4e2c-9f5e-4de4-adfe-ce609e443057"},
#         {"href"=>"http://api.songkick.com/api/3.0/artists/mbid:2179873c-4c41-474b-86c0-480614137ec8.json",
#          "mbid"=>"2179873c-4c41-474b-86c0-480614137ec8"},
#         {"href"=>"http://api.songkick.com/api/3.0/artists/mbid:b070e149-9ae5-4933-bdb5-8ea656aaa379.json",






# ================================================================
# CONCERT ONLY:


# [7] pry(#<EventsController>)> results = remote.events(artist_name: 'Metallica', type: 'concert')
# => #<Songkickr::EventResult:0x00007f9ca6c2e828
#  @page=1,
#  @result_key_string="event",
#  @result_type="Event",
#  @results=
#   [#<Songkickr::Event:0x00007f9ca6c2e170
#     @display_name="Metallica at Kohl Center (September 2, 2018)",
#     @id=33178199,
#     @location=#<Songkickr::Location:0x00007f9ca6c2e080 @city="Madison, WI, US", @lat=43.0697915, @lng=-89.3957429>,
#     @performances=
#      [#<Songkickr::Performance:0x00007f9ca6c2c910
#        @artist=
#         #<Songkickr::Artist:0x00007f9ca6c2c7a8
#          @display_name="Metallica",
#          @id=331163,
#          @identifier=
#           [{"href"=>"http://api.songkick.com/api/3.0/artists/mbid:65f4f0c5-ef9e-490c-aee3-909e7ae6b2ab.json",
#             "mbid"=>"65f4f0c5-ef9e-490c-aee3-909e7ae6b2ab"}],
#          @on_tour_until=nil,
#          @uri="http://www.songkick.com/artists/331163-metallica?utm_source=48987&utm_medium=partner">,
#        @billing="headline",
#        @billing_index=1,
#        @display_name="Metallica",
#        @id=63814764>],
#     @popularity=0.445389,
#     @start=Sun, 02 Sep 2018 00:00:00 +0000,
#     @status="ok",
#     @tickets_uri=nil,
#     @type="Concert",
#     @uri="http://www.songkick.com/concerts/33178199-metallica-at-kohl-center?utm_source=48987&utm_medium=partner",
#     @venue=
#      #<Songkickr::Venue:0x00007f9ca6c2d950
#       @capacity=nil,
#       @description=nil,
#       @display_name="Kohl Center",
#       @id=5943,
#       @lat=43.0697915,
#       @lng=-89.3957429,
#       @metro_area=
#        #<Songkickr::MetroArea:0x00007f9ca6c2d6d0
#         @country="US",
#         @display_name="Madison",
#         @id=8265,
#         @state="WI",
#         @uri="http://www.songkick.com/metro_areas/8265-us-madison?utm_source=48987&utm_medium=partner">,
#       @phone=nil,
#       @street=nil,
#       @uri="http://www.songkick.com/venues/5943-kohl-center?utm_source=48987&utm_medium=partner",
#       @website=nil,
#       @zip=nil>>,
#    #<Songkickr::Event:0x00007f9ca6c2c6b8
#     @display_name="Metallica at Target Center (September 4, 2018)",
#     @id=33178214,
#     @location=#<Songkickr::Location:0x00007f9ca6c2c668 @city="Minneapolis, MN, US", @lat=44.979657, @lng=-93.274889>,
#     @performances=
#      [#<Songkickr::Performance:0x00007f9ca6c27410
#        @artist=
#         #<Songkickr::Artist:0x00007f9ca6c272f8
#          @display_name="Metallica",
#          @id=331163,
#          @identifier=
#           [{"href"=>"http://api.songkick.com/api/3.0/artists/mbid:65f4f0c5-ef9e-490c-aee3-909e7ae6b2ab.json",
#             "mbid"=>"65f4f0c5-ef9e-490c-aee3-909e7ae6b2ab"}],
#          @on_tour_until=nil,
#          @uri="http://www.songkick.com/artists/331163-metallica?utm_source=48987&utm_medium=partner">,
#        @billing="headline",
#        @billing_index=1,
#        @display_name="Metallica",
#        @id=63814784>],
#     @popularity=0.445389,
#     @start=Tue, 04 Sep 2018 00:00:00 +0000,
#     @status="ok",
#     @tickets_uri=nil,
#     @type="Concert",
#     @uri="http://www.songkick.com/concerts/33178214-metallica-at-target-center?utm_source=48987&utm_medium=partner",
#     @venue=
#      #<Songkickr::Venue:0x00007f9ca6c2c5a0
#       @capacity=nil,
#       @description=nil,
#       @display_name="Target Center",
#       @id=1054,
#       @lat=44.979657,
#       @lng=-93.274889,
#       @metro_area=
#        #<Songkickr::MetroArea:0x00007f9ca6c2c348
#         @country="US",
#         @display_name="Twin Cities",
#         @id=35130,
#         @state="MN",
#         @uri="http://www.songkick.com/metro_areas/35130-us-twin-cities?utm_source=48987&utm_medium=partner">,
#       @phone=nil,
#       @street=nil,
#       @uri="http://www.songkick.com/venues/1054-target-center?utm_source=48987&utm_medium=partner",
#       @website=nil,
#       @zip=nil>>,
#    #<Songkickr::Event:0x00007f9ca6c271e0
#     @display_name="Metallica at Pinnacle Bank Arena (September 6, 2018)",
#     @id=33178344,
#     @location=#<Songkickr::Location:0x00007f9ca6c27140 @city="Lincoln, NE, US", @lat=40.8184465, @lng=-96.7128179>,
#     @performances=
#      [#<Songkickr::Performance:0x00007f9ca6c25e08
#        @artist=
#         #<Songkickr::Artist:0x00007f9ca6c25db8
#          @display_name="Metallica",
#          @id=331163,
#          @identifier=
#           [{"href"=>"http://api.songkick.com/api/3.0/artists/mbid:65f4f0c5-ef9e-490c-aee3-909e7ae6b2ab.json",
#             "mbid"=>"65f4f0c5-ef9e-490c-aee3-909e7ae6b2ab"}],
#          @on_tour_until=nil,
#          @uri="http://www.songkick.com/artists/331163-metallica?utm_source=48987&utm_medium=partner">,
#        @billing="headline",
#        @billing_index=1,
#        @display_name="Metallica",
#        @id=63815204>],
#     @popularity=0.445389,
#     @start=Thu, 06 Sep 2018 00:00:00 +0000,
#     @status="ok",
#     @tickets_uri=nil,
#     @type="Concert",
#     @uri="http://www.songkick.com/concerts/33178344-metallica-at-pinnacle-bank-arena?utm_source=48987&utm_medium=partner",
#     @venue=
#      #<Songkickr::Venue:0x00007f9ca6c27000
#       @capacity=nil,
#       @description=nil,
#       @display_name="Pinnacle Bank Arena",
#       @id=2224159,
#       @lat=40.8184465,
#       @lng=-96.7128179,
#       @metro_area=
#        #<Songkickr::MetroArea:0x00007f9ca6c26ec0
#         @country="US",
#         @display_name="Lincoln",
#         @id=5244,
#         @state="NE",
#         @uri="http://www.songkick.com/metro_areas/5244-us-lincoln?utm_source=48987&utm_medium=partner">,
#       @phone=nil,



