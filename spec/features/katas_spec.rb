require 'rails_helper'
require 'capybara'
describe 'Kata' do

  it 'can be read' do
    kata_title='Second title'
    kata_description='Second Description'

    create_kata(title:'title', description:'description')
    create_kata(title:kata_title, description: kata_description)

    visit root_path
    click_on(kata_title)

    expect(page).to have_content(kata_title)
    expect(page).to have_content(kata_description)

  end
  it 'can be created' do
    kata_title='Second title'
    kata_description='Second Description'
    visit root_path
    click_on('New Kata')
    fill_in(:title, with: kata_title)
    fill_in(:description, with: kata_description)
    click_on('Save')
    expect(page).to have_content(kata_title)
    expect(page).to have_content(kata_description)

  end


  def create_kata(title:'kata title', description:'description kata')
    kata = Kata.new(title: title, description: description)
    kata.save

  end
end
