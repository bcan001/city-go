class UserRsvpsController < ApplicationController

	def new
		if !current_user # there is no signed in user
			redirect_to new_user_session_path
		else
			@event = Event.find(params[:event_id])
			@user_rsvp = current_user.user_rsvps.build(event_id: @event.id)
		end
	end

	def create
		# binding.pry
		@event = Event.find(user_rsvp_params[:event_id])
		@user_rsvp = UserRsvp.new(user_rsvp_params)
		
		# POTENTIALLY SEND EMAIL /


		respond_to do |format|
       if @user_rsvp.save
          format.html { redirect_to @event, notice: "You have successfully RSVP'd for #{@event.title}!" }
          format.json { render :show, status: :created, location: @event }
       else
          format.html { render :new }
          format.json { render json: @user_rsvp.errors, status: :unprocessable_entity }
       end
    end
	end

	def destroy


	end

	def user_rsvp_params
		params.require(:user_rsvp).permit(:id, :user_id, :event_id, :first_name, :last_name, :email)
	end


end