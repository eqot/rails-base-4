require "rails_helper"

describe Problem do

  it "has a valid factory" do
    expect(build(:problem)).to be_valid
  end

end
