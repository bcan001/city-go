require "rails_helper"

RSpec.describe ArtistsController, :type => :controller do

	before :each do |example|
		unless example.metadata[:skip_test]
    	@artist = FactoryBot.create(:artist)
    end
  end

	describe "GET index" do
    it 'it renders the index template successfully' do
    	get :index
      expect(response).to be_successful
    end

    describe "GET index" do
	    it 'populates an array of artists' do
		    get :index
		    expect(assigns(:artists)).to eq [@artist]
	    end
	  end
  end

  describe "GET show" do
    it 'it renders the show template successfully' do
    	get :show, params: { id: @artist.id }
      expect(response).to be_successful
    end

    it 'populates an artist' do
	    get :show, params: { id: @artist.id }
	    expect(assigns(:artist)).to eq @artist
    end
  end





end







