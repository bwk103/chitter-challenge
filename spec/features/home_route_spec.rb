feature 'home route', type: :feature do

  scenario 'displays hello world' do
    visit '/'
    expect(page).to have_content 'Hello world'
  end

end
