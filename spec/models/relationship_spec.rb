require 'rails_helper'

RSpec.describe Relationship do

  let(:relating) { create(:problem) }
  let(:related) { create(:problem) }
  let(:relationship) { relating.relationships.build(related_id: related.id) }

  subject { relationship }

  it { should be_valid }

  describe "relating methods" do
    it { should respond_to(:relating) }
    it { should respond_to(:related) }
  end

end
