require 'rails_helper'

feature 'User signs in' do
  scenario 'success login' do
    user = User.create email: 'vasco@gmail.com', password: 'iasdodioas'
    visit sign_in_path

    within 'form' do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: 'iasdodioas'

      click_on 'Sign in'
    end

    expect(page).to have_content 'Welcome'
  end 
end