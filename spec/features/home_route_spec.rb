feature 'home route', type: :feature do

  scenario "redirects to /peeps" do
    visit '/'
    expect(current_path).to eq '/peeps'
  end

end
