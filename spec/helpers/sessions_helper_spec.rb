require 'rails_helper'

RSpec.describe SessionsHelper, type: :helper do
  let(:user) { create(:user, :common_user) }

  describe 'token / logged_in?' do
    subject { token(user.id) }
    it 'generates jwt' do
      expect(subject).to be_present
    end
  end
end
