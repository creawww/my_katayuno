require 'rails_helper'
require 'capybara'
describe 'Kata' do

  before(:each) do
    log_in
  end

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
    fill_in(:kata_title, with: kata_title)
    fill_in(:kata_description, with: kata_description)
    click_on('Save')

    expect(page).to have_content(kata_title)
    expect(page).to have_content(kata_description)
  end

  it 'can be edited' do
    create_kata
    new_title = 'New title'
    new_description = 'New description'

    visit root_path
    click_on('Edit')
    fill_in(:kata_title, with: new_title)
    fill_in(:kata_description, with: new_description)
    click_on('Save')

    expect(page).to have_content(new_title)
    expect(page).to have_content(new_description)
  end

  it 'can be delete' do
    kata= create_kata

    visit root_path
    click_on('delete')

    expect(page).not_to have_content(kata.title)
  end

  def create_kata(title:'kata title', description:'description kata')
    kata = Kata.new(title: title, description: description)
    kata.save
  end
  def log_in
    user = User.new(email: 'manolo@manolo.es',
      password: '123456'
    )
    user.save

    visit '/users/sign_in'
    fill_in(:user_email, with: 'manolo@manolo.es')
    fill_in(:user_password, with: '123456')

    click_on('Log in')
  end
end
