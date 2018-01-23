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

  def create_kata(title:'kata title', description:'description kata')
    kata = Kata.new(title: title, description: description)
    kata.save

  end
end
