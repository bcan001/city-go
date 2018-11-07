class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
	validates :last_name, presence: true
	validates :email, presence: true, uniqueness: true
	validates :username, presence: true, uniqueness: true


  has_many :user_favorites
  has_many :votes

  has_many :user_rsvps, dependent: :destroy

  def upcoming_rsvp_events(limit)
    upcoming_rsvp_events = []
    user_rsvps.each do |user_rsvp|
      event = Event.find(user_rsvp.event_id)
      if event.event_date >= Time.now.in_time_zone("Central Time (US & Canada)").to_datetime.beginning_of_day
        upcoming_rsvp_events << event
      end
    end
    upcoming_rsvp_events.take(limit)
  end

  def past_rsvp_events(limit)
    past_rsvp_events = []
    user_rsvps.each do |user_rsvp|
      event = Event.find(user_rsvp.event_id)
      if event.event_date < Time.now.in_time_zone("Central Time (US & Canada)").to_datetime.beginning_of_day
        past_rsvp_events << event
      end
    end
    past_rsvp_events.take(limit)
  end

  # def user_rsvp_events(limit)
  #   rsvp_events = []
  #   user_rsvps.each do |user_rsvp|
  #     event = Event.find(user_rsvp.user_id)
  #     rsvp_events << event
  #   end
  #   rsvp_events.take(limit)
  # end

  def favorite_events
    favorite_events = []
    user_favorites.where(favorite_type: 'event').each do |favorite_event|
      favorite_events << Event.find(favorite_event.favorite_id)
    end
    favorite_events
  end

  def favorite_venues
    favorite_venues = []
    user_favorites.where(favorite_type: 'venue').each do |favorite_venue|
      favorite_venues << Venue.find(favorite_venue.favorite_id)
    end
    favorite_venues
  end

  def favorite_artists
    favorite_artists = []
    user_favorites.where(favorite_type: 'artist').each do |favorite_artist|
      favorite_artists << Artist.find(favorite_artist.favorite_id)
    end
    favorite_artists
  end


  # toggle images for the user
  def has_upvoted_an_event?(event)
    votes.where(vote_type: 'event', vote_id: event.id).any? ? true : false
  end

  def has_favorited_an_event?(event)
    favorited_events.include?(event) ? true : false
  end

end







