require 'spec_helper.rb'

feature "Looking up movies", js: true do
	before do
      Movie.create!(name: 'The Shinning' , description: 'Horror' , duration: 90)
      Movie.create!(name: 'The Good Fellas' , description: 'Crime' , duration: 90)
      Movie.create!(name: 'Django Unchained' , description: 'Crime' , duration: 90)
      Movie.create!(name: 'Star Wars' , description: 'sci-fi' , duration: 90)
	end
  scenario "finding movies" do
    visit '/'
    fill_in "keywords", with: "Star"
    click_on "Search"

    expect(page).to have_content("Star Wars")    
  end
end