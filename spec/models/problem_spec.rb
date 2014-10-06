require "rails_helper"

describe Problem do

  it "has a valid factory" do
    expect(build(:problem)).to be_valid
  end

  it "is invalid without a title" do
    problem = build(:problem, title: nil)
    expect(problem).to have(1).errors_on(:title)
  end

  it "checks if valid user is submitted" do
    user = build(:user)
    problem = build(:problem, owner_id: user)
    problem.submitted_by?(user).should be_truthy
  end

end
