require "rails_helper"

RSpec.describe EventsController, :type => :controller do

	before :each do
    @event = FactoryBot.create(:event)
  end

	describe "GET index" do
    it 'populates an array of events' do
	    get :index
	    expect(assigns(:events)).to eq [@event]
    end
  end

  describe "GET show" do
    it 'populates an event' do
	    get :show, params: { id: @event.id }
	    expect(assigns(:event)).to eq @event
    end
  end




end


