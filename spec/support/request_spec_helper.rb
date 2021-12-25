module RequestSpecHelper
  def headers(token)
    { 'Authorization': "Bearer #{token}" }
  end

  def sign_in_as_user(user, token)
    post login_path(
           params: {
             session: {
               email: user.email,
               password: user.password
             }
           },
           headers: headers(token)
         )
  end
end
