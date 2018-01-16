feature 'comments', type: :feature do

  before(:each) do
    DatabaseCleaner.clean
    new_user
    visit '/peeps/new'
    single_peep
  end

  scenario 'users see an option to comment on a peep' do
    visit '/peeps'
    expect(page).to have_link 'Comment'
  end

  scenario 'users are taken to a comment form' do
    visit '/peeps'
    click_link 'Comment'
    expect(current_path).to eq '/peeps/1/comments/new'
  end

  scenario 'users can see a form to comment on the peep' do
    visit '/peeps'
    click_link 'Comment'
    expect(page).to have_field 'content'
    expect(page).to have_button 'Comment'
  end

  scenario "users' comments are saved to the database" do
    visit '/peeps'
    click_link 'Comment'
    fill_in 'content', with: 'This is the first comment'
    click_button 'Comment'
    comment = Comment.first
    expect(comment.content).to eq 'This is the first comment'
    expect(page).to have_content 'This is the first comment'
  end

 scenario "users must be signed in to leave a comment" do
   click_button 'Sign out'
   click_link 'Comment'
   expect(page).to have_content 'You must be signed in to leave a comment'
 end

end
