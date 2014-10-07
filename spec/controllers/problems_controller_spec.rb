require "rails_helper"

describe ProblemsController do

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

end
