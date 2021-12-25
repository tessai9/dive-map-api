# frozen_string_literal: true

module RequestSpecHelper
  def sign_in_as_user(user)
    allow_any_instance_of(SessionsHelper).to receive(:current_user).and_return(user)
  end
end
