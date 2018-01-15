feature 'adding peeps', type: :feature do
  before(:each) do
    DatabaseCleaner.clean
    new_user
  end

  scenario 'users can see a form to add peeps' do
    visit '/peeps/new'
    expect(page).to have_field 'content'
    expect(page).to have_button 'Peep'
  end

  scenario 'users are redirected to /peeps' do
    visit 'peeps/new'
    fill_in 'content', with: 'test'
    click_button 'Peep'
    expect(current_path).to eq '/peeps'
  end

  scenario 'peeps are saved to the database' do
    visit 'peeps/new'
    fill_in 'content', with: 'This is a test'
    click_button 'Peep'
    expect(page).to have_content 'This is a test'
  end

  scenario 'users not signed in cannot post a peep' do
    click_button 'Sign out'
    visit 'peeps/new'
    expect(page).to have_content 'You must be signed in to post a Peep'
  end
end
