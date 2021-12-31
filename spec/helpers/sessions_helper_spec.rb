# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SessionsHelper, type: :helper do
  let(:user) { create(:user, :common_user) }

  describe 'token / logged_in?' do
    subject(:token) { token(user.id) }

    it 'generates jwt' do
      expect(:token).to be_present
    end
  end
end
