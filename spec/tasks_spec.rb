require 'spec_helper'
require 'capybara/rspec'
require_relative '../app'

Capybara.app = App

feature 'it manages tasks' do
  scenario 'user can see the homepage' do
    visit '/'
    expect(page).to have_content 'Welcome'
  end
end