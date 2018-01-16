feature 'profile pictures', type: :feature do

  scenario 'users can specify a route to a profile picture' do
    visit 'users/new'
    expect(page).to have_field 'profile_image_url'
  end

end
