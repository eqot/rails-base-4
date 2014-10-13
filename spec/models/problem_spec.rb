require "rails_helper"

describe Problem do

  it { should respond_to(:relationships) }
  it { should respond_to(:relating_problems) }
  it { should respond_to(:reverse_relationships) }
  it { should respond_to(:related_problems) }
  it { should respond_to(:relating?) }
  it { should respond_to(:relate!) }
  it { should respond_to(:unrelate!) }

  it "has a valid factory" do
    expect(build(:problem)).to be_valid
  end

  it "is invalid without a title" do
    problem = build(:problem, title: nil)
    expect(problem).to have(1).errors_on(:title)
  end

  it "is invalid without an owner id" do
    problem = build(:invalid_problem)
    expect(problem).to have(1).errors_on(:owner_id)
  end

  describe "checks its owner" do

    before :each do
      @user = create(:user)
      @problem = build(:problem, owner_id: @user.id)
    end

    it "with correct user" do
      expect(@problem.submitted_by?(@user)).to be_truthy
    end

    it "with incorrect user" do
      incorrect_user = create(:user)
      expect(@problem.submitted_by?(incorrect_user)).to be_falsey
    end

  end

  describe "relating" do

    # let(:problem) { create(:problem) }
    let(:another_problem) { create(:problem) }

    before do
      @problem = create(:problem)
      @problem.save
      @problem.relate!(another_problem)
    end

    subject { @problem }

    it { should be_relating(another_problem) }

    describe "unrelating" do

      before { @problem.unrelate!(another_problem) }

      it { should_not be_relating(another_problem) }

    end

    # subject { @another_problem }

  end

end
