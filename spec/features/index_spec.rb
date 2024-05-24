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
        # description
        expect(page).to have_content("SWEET POTA")
        # gti_upc
        expect(page).to have_content("832298010009")
        # brand_owner
        expect(page).to have_content("NOT A BRANDED ITEM")
        # ingredients & there are no ingredients for this search result
        expect(page).to have_content("Ingredients:")
      end
    end
  end
end