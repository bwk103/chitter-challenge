feature 'sign in', type: :feature do

  before(:each) do
    DatabaseCleaner.clean
    User.create(name:'Mia', username: 'mia', email: 'mia@test.com', password: 'test',
                confirm_password: 'test')
  end

  scenario 'Users see a sign in form' do
    visit '/sessions/new'
    expect(page).to have_field 'username'
    expect(page).to have_field 'password'
    expect(page).to have_button 'Sign In'
  end

  scenario 'users are redirected to links' do
    visit '/sessions/new'
    sign_in
    expect(current_path).to eq '/peeps'
  end

  scenario 'welcomes user by name' do
    visit '/sessions/new'
    sign_in
    expect(page).to have_content 'Welcome, Mia'
  end

  scenario 'users redirected if not authorised' do
    incorrect_sign_in
    expect(current_path).to eq '/sessions/new'
  end

  scenario 'users are told there is a problem if not authorised' do
    incorrect_sign_in
    expect(page).to have_content 'The email or password is incorrect'
  end

end
