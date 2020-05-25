# frozen_string_literal: true
require 'rails_helper'
RSpec.describe 'Testing the login', type: :system do
  scenario 'valid inputs' do
    visit root_path
    fill_in 'Email', with: 'expeditojazz@gmail.com'
    fill_in 'Password', with: 'foobar'
    click_on 'Log in'
    visit root_path
    expect(page).to have_content('Search for a specific post you like')
  end
end