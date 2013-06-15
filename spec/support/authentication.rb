module AuthenticationForFeatureRequest
  def login( user, password = 'login' )
    user.update_attribute :password, password

    page.driver.post( sessions_path, {email: user.email, password: password, password_confirmation: password} )
    visit user_path(user.id)
  end
end
