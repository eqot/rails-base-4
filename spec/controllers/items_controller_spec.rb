require "rails_helper"

describe IdeasController do

  before :each do
    user = create(:user)
    session[:user_id] = user.id
  end

  describe "GET #show" do

    it "assigns the requested idea to @idea" do
      idea = create(:idea)
      get :show, id: idea
      expect(assigns(:idea)).to eq idea
    end

    it "renders the :show template" do
      idea = create(:idea)
      get :show, id: idea
      expect(response).to render_template :show
    end

  end

  describe "GET #index" do

    it "renders the :index template" do
      idea1 = create(:idea)
      idea2 = create(:idea)
      get :index
      expect(assigns(:ideas)).to match_array([idea1, idea2])
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end

  end

  describe "POST #create" do

    context "with valid attributes" do

      it "saves the new idea in the database" do
        expect {
          post :create, idea: attributes_for(:idea)
        }.to change(Idea, :count).by(1)
      end

      it "redirects to ideas#show" do
        post :create, idea: attributes_for(:idea)
        expect(response).to redirect_to idea_path(assigns[:idea])
      end

    end

    # context "with invalid attributes" do
    #
    #   it "does not save the new idea in the database" do
    #     expect {
    #       post :create, idea: attributes_for(:invalid_idea)
    #     }.to_not change(Idea, :count)
    #   end
    #
    # end

  end

  describe "PATCH #update" do

    before :each do
      @idea = create(:idea, owner_id: 123)
    end

    context "valid attributes" do

      # it "locates the requested @idea" do
      #   patch :update, id: @idea, idea: attributes_for(:idea)
      #   expect(assigns(:idea)).to eq(@idea)
      # end

      # it "redirects to ideas#show" do
      #   post :create, idea: attributes_for(:idea)
      #   expect(response).to redirect_to idea_path(assigns[:idea])
      # end

    end

  end

end
