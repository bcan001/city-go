class VotesController < ApplicationController


	def create
		if !current_user
			redirect_to new_user_session_path
		else
			if params[:event_id]
				# upvote the event
				existing_vote_for_selected_event = current_user.votes.find_by(vote_type: 'event', vote_id: params[:event_id])
				if existing_vote_for_selected_event
					redirect_to root_path, notice: "You've already previously upvoted the event"
				else
					vote = current_user.votes.build(vote_type: 'event', vote_id: params[:event_id])
					vote.save
					redirect_to root_path, notice: "You've succesfully upvoted the event"
				end
			elsif params[:artist_id]
				existing_vote_for_selected_artist = current_user.votes.find_by(vote_type: 'artist', vote_id: params[:artist_id])
				if existing_vote_for_selected_artist
					redirect_to artist_path(params[:artist_id]), notice: "You've already previously upvoted the artist"
				else
					vote = current_user.votes.build(vote_type: 'artist', vote_id: params[:artist_id])
					vote.save
					redirect_to artist_path(params[:artist_id]), notice: "You've succesfully upvoted the artist"
				end
			end
		end
	end




end

