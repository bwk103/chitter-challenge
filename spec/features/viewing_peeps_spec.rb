require 'timecop'

feature 'viewing peeps', type: :feature do
  before(:each) do
    new_user
    single_peep
  end

  scenario 'users can view peeps' do
    visit '/peeps'
    expect(page).to have_content 'This is a peep!'
  end

  scenario 'peeps are displayed in reverse chronological order' do
    visit '/peeps/new'
    fill_in 'content', with: 'This will be at the top of the page'
    click_button 'Peep'
    top_peep = first('li')
    expect(top_peep).to have_content 'This will be at the top of the page'
  end

  scenario 'peeps store the date and time they were posted' do
    visit '/peeps/new'
    fill_in 'content', with: 'This is another peep'
    Timecop.freeze do
      click_button 'Peep'
      peep = Peep.last
      expect(peep.time_posted).to eq Time.now
    end
  end

  scenario 'peeps display the date and time they were posted' do
    visit '/peeps/new'
    fill_in 'content', with: 'Another test peep'
    Timecop.freeze(Time.local(2018)) do
      click_button 'Peep'
      expect(page).to have_content '2018-01-01 00:00:00'
    end
  end
end
