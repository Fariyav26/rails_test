require 'rails_helper'

RSpec.feature "SimCars", type: :feature do

  context 'Simulating a Car' do
    Steps 'Creating a Car' do

      Given 'I am on the index page' do
        visit '/cars/index'
      end
      Then 'I fill in the car make and model year' do
        fill_in 'make', with: 'Ford'
        fill_in 'model_year', with: '2009'
      end
      And 'I can submit the information' do
        click_button 'Submit'
      end
      Then 'I can see my cars information'do
        expect(page).to have_content('Make: Ford')
        expect(page).to have_content('Model Year: 2009')
      end
      And 'I can see the speed of the car' do
        expect(page).to have_content('Speed: 0mph')
      end
      When 'I can click accelerate button' do
        click_button 'Accelerate'
      end
      Then 'I can see the updated speed' do
       expect(page).to have_content('Speed: 10mph')
      end
      When 'I can click brake button' do
        click_button 'Brake'
      end
      Then 'I can see the updated speed' do
       expect(page).to have_content('Speed: 3mph')
      end
      When 'I brake the car stops at 0' do
        expect(page).to have_content('Speed: 0mph')
      end
    end

  end

end
# next we need to make a view, a route and action(ex.create)
