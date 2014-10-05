require "rails_helper"

describe User do

  it "is valid with provider, uid, name" do
    user = User.new(
      provider: "Provider",
      uid: "Uid",
      name: "Name"
    )
    expect(user).to be_valid
  end

  it "is invalid without a provider" do
    expect(User.new(provider: nil)).to have(1).errors_on(:provider)
  end

  it "is invalid without an uid" do
    expect(User.new(uid: nil)).to have(1).errors_on(:uid)
  end

  it "is invalid without a name" do
    expect(User.new(name: nil)).to have(1).errors_on(:name)
  end

end
