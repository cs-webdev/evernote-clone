require 'rails_helper'

feature 'access to account page' do 
  scenario 'guest goes to account page' do
    visit account_path

    expect(page).to have_content('not authorize')
  end

  scenario 'user goes to his account page' do
    user = User.create email: 'vasco@gmail.com', password: 'aasdjasjdas'
    
    visit account_path(as: user)
    expect(page).to have_content('vasco@gmail.com')
  end
end