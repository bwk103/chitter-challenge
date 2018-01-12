module PeepHelpers

  def single_peep
    visit '/peeps/new'
    fill_in 'content', with: 'This is a peep!'
    click_button 'Peep'
  end

end
