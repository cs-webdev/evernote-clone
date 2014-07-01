require 'rails_helper'

feature 'User signs in' do
  scenario 'success login' do
    user = User.create email: 'vasco@gmail.com', password: 'iasdodioas', username: random_string
    visit sign_in_path

    within 'form' do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password

      click_on 'Sign in'
    end

    expect(page).to have_content "Welcome, #{user.username} "
  end 
end

feature 'Account creation' do
  scenario 'Guest creates account with username' do
    user = User.new email: 'vasco@gmail.com', username: random_string, password: 'oasidoapsjdsojf'
    visit sign_up_path

    within 'form' do
      fill_in 'Email', with: user.email
      fill_in 'Username', with: user.username
      fill_in 'Password', with: user.password

      click_on 'Sign up'
    end

    expect(page).to have_content "Welcome, #{user.username}"
  end
end

private
def random_string
  (0...8).map { ('a'..'z').to_a[rand(26)] }.join
end