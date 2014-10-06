require "rails_helper"

describe User do

  it "has a valid factory" do
    expect(FactoryGirl.build(:user)).to be_valid
  end

  it "is invalid without a provider" do
    user = FactoryGirl.build(:user, provider: nil)
    expect(user).to have(1).errors_on(:provider)
  end

  it "is invalid without an uid" do
    user = FactoryGirl.build(:user, uid: nil)
    expect(user).to have(1).errors_on(:uid)
  end

  it "is invalid without a name" do
    user = FactoryGirl.build(:user, name: nil)
    expect(user).to have(1).errors_on(:name)
  end

  it "is invalid without an image url" do
    user = FactoryGirl.build(:user, image_url: nil)
    expect(user).to have(1).errors_on(:image_url)
  end

  it "is invalid with a duplicate provider and uid" do
    FactoryGirl.create(:user)
    user = FactoryGirl.build(:user)
    expect(user).to have(1).errors_on(:uid)
  end

end
