require 'spec_helper'

# Feature: 'About' Page
#   As a visitor
#   I want to visit an 'about' page
#   So I can learn more about the website
feature 'About Page' do

  # Scenario: Visit the 'About' Page
  #   Given I am a visitor
  #   When I visit the 'about' page
  #   Then I should see "About the Website"
  scenario 'Visit the About Page' do
    visit 'pages/about'
    expect(page).to have_content 'About the Website'
  end

end
