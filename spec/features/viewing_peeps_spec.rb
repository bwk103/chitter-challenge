feature 'viewing peeps', type: :feature do
  before(:each) do
    Peep.create(content: 'This is my first peep!', time_posted: Time.now)
  end

  scenario 'users can view peeps' do
    visit '/peeps'
    expect(page).to have_content 'This is my first peep!'
  end

  scenario 'peeps are displayed in reverse chronological order' do
    visit '/peeps/new'
    fill_in 'content', with: 'This will be at the top of the page'
    click_button 'Peep'
    top_peep = first('li')
    expect(top_peep).to have_content 'This will be at the top of the page'
  end

end
