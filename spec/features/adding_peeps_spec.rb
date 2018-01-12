feature 'adding peeps', type: :feature do

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
end
