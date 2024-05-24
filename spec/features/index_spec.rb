require 'rails_helper'

RSpec.describe 'Food Search Results Index Page' do
  it 'can display search results with Food PORO attrs and total hits' do
    VCR.use_cassette("sweet_potatoes") do
      visit root_path
      fill_in 'query', with: 'sweet potatoes'
      click_on 'Search'

      expect(current_path).to eq(foods_path)

      within '#food-results' do
        foods_result_number = all('ul > li').size

        expect(foods_result_number).to eq 10
        expect(page).to have_content("Description:")
        expect(page).to have_content("GTIN/UPC code:")
        expect(page).to have_content("Brand Owner:")
        expect(page).to have_content("Ingredients:")
      end
    end
  end
end