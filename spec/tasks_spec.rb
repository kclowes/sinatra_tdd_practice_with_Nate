require 'spec_helper'
require 'capybara/rspec'
require_relative '../app'

Capybara.app = App

feature 'it manages tasks' do
  scenario 'user can see the homepage' do
    visit '/'
    within 'h1' do
      expect(page).to have_content 'Manage your Tasks'
    end
    click_link 'Add a Task'
    fill_in 'new_task', with: 'Go shopping'
    click_button 'Add Task'
    expect(page).to have_content 'Go shopping'
  end
end