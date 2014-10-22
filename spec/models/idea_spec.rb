require "rails_helper"

describe Idea do

  it { should respond_to(:relationships) }
  it { should respond_to(:relating_ideas) }
  it { should respond_to(:reverse_relationships) }
  it { should respond_to(:related_ideas) }
  it { should respond_to(:relating?) }
  it { should respond_to(:relate!) }
  it { should respond_to(:unrelate!) }

  it "has a valid factory" do
    expect(build(:idea)).to be_valid
  end

  it "is invalid without a title" do
    idea = build(:idea, title: nil)
    expect(idea).to have(1).errors_on(:title)
  end

  it "is invalid without an owner id" do
    idea = build(:invalid_idea)
    expect(idea).to have(1).errors_on(:owner_id)
  end

  describe "checks its owner" do

    before :each do
      @user = create(:user)
      @idea = build(:idea, owner_id: @user.id)
    end

    it "with correct user" do
      expect(@idea.submitted_by?(@user)).to be_truthy
    end

    it "with incorrect user" do
      incorrect_user = create(:user)
      expect(@idea.submitted_by?(incorrect_user)).to be_falsey
    end

  end

  describe "relating" do

    # let(:idea) { create(:idea) }
    let(:another_idea) { create(:idea) }

    before do
      @idea = create(:idea)
      @idea.save
      @idea.relate!(another_idea)
    end

    subject { @idea }

    it { should be_relating(another_idea) }

    describe "unrelating" do

      before { @idea.unrelate!(another_idea) }

      it { should_not be_relating(another_idea) }

    end

    # subject { @another_idea }

  end

end
