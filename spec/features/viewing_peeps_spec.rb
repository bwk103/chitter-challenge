feature 'viewing peeps', type: :feature do
  before(:each) do
    Peep.create(content: 'This is my first peep!', time_posted: Time.now)
  end

  scenario 'users can view peeps' do
    visit '/peeps'
    expect(page).to have_content 'This is my first peep!'
  end

end
