require 'rails_helper'

describe Card do
  let(:user){create(:user)}
  let(:card){create(:card, user_id: user.id)}
  describe '#create' do
    it "customer_idとcard_idが存在すれば登録できること" do
      expect(card).to be_valid
    end
  end
end