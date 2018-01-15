feature 'sign out', type: :feature do

  before(:each) do
    visit '/sessions/new'
    sign_in
  end

  scenario 'users see sign out button when they are signed in' do
    expect(page).to have_button 'Sign out'
  end

  scenario "users remain on '/peeps route" do
    expect(current_path).to eq '/peeps'
  end

  scenario "users are told, 'Goodbye" do
    click_button 'Sign out'
    expect(page).to have_content 'Goodbye'
  end

  scenario 'users do not see sign out button when not signed in' do
    click_button 'Sign out'
    expect(page).not_to have_button 'Sign out'
  end

end
