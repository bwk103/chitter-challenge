feature 'sign up', type: :feature do

  scenario 'users can see a sign up form' do
    visit '/users/new'
    expect(page).to have_field 'name'
    expect(page).to have_field 'username'
    expect(page).to have_field 'email'
    expect(page).to have_field 'password'
    expect(page).to have_field 'confirm_password'
    expect(page).to have_button 'Sign Up'
  end

  scenario "users are redirected to '/peeps'" do
    new_user
    expect(current_path).to eq '/peeps'
  end

  scenario 'users are welcomed by name' do
    new_user
    expect(page).to have_content 'Welcome, Alex'
  end

  scenario 'users are saved to the database' do
    new_user
    added_user = User.first
    expect(added_user.name).to eq 'Alex'
  end

end
