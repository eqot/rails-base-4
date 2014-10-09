require "rails_helper"

describe ProblemsController do

  before :each do
    user = create(:user)
    session[:user_id] = user.id
  end

  describe "GET #show" do

    it "assigns the requested problem to @problem" do
      problem = create(:problem)
      get :show, id: problem
      expect(assigns(:problem)).to eq problem
    end

    it "renders the :show template" do
      problem = create(:problem)
      get :show, id: problem
      expect(response).to render_template :show
    end

  end

  describe "GET #index" do

    it "renders the :index template" do
      problem1 = create(:problem)
      problem2 = create(:problem)
      get :index
      expect(assigns(:problems)).to match_array([problem1, problem2])
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end

  end

  describe "POST #create" do

    context "with valid attributes" do

      it "saves the new problem in the database" do
        expect {
          post :create, problem: attributes_for(:problem)
        }.to change(Problem, :count).by(1)
      end

      it "redirects to problems#show" do
        post :create, problem: attributes_for(:problem)
        expect(response).to redirect_to problem_path(assigns[:problem])
      end

    end

  end

end
