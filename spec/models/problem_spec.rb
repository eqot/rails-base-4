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
    user = create(:user)
    problem = build(:problem, owner_id: user.id)
    expect(problem.submitted_by?(user)).to be_truthy
  end

  it "checks if invalid user is not submitted" do
    user = create(:user)
    user2 = create(:user)
    problem = build(:problem, owner_id: user.id)
    expect(problem.submitted_by?(user2)).to be_falsey
  end

end
