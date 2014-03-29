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

    by 'user can add a task' do
      click_link 'Add a Task'
      fill_in 'new_task', with: 'Go shopping'
      click_button 'Add Task'
      expect(page).to have_content 'Go shopping'
    end

    and_by 'user can view tasks individually' do
      click_link 'Show Task'
      expect(page).to have_content 'Go shopping'
    end

    and_by 'user can edit tasks' do
      click_link 'Edit Task'
      fill_in 'edit_task', with: 'Clean'
      click_button 'Edit Task'
      expect(page).to_not have_content 'Go shopping'
      expect(page).to have_content 'Clean'
    end

    and_by 'user can delete tasks' do
      click_link 'Show Task'
      click_button 'Delete Task'
      expect(page).to_not have_content 'Clean'
    end
  end
end