module UserHelpers

  def new_user
    visit '/users/new'
    fill_in 'name', with: 'Alex'
    fill_in 'username', with: 'crazy_alex101'
    fill_in 'email', with: 'alex@test.com'
    fill_in 'password', with: 'test'
    fill_in 'confirm_password', with: 'test'
    click_button 'Sign Up'
  end

  def sign_in
    fill_in 'username', with: 'mia'
    fill_in 'password', with: 'test'
    click_button 'Sign In'
  end

  def incorrect_sign_in
    visit '/sessions/new'
    fill_in 'username', with: 'mia'
    fill_in 'password', with: 'wrong'
    click_button 'Sign In'
  end

end
