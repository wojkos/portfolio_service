require 'rails_helper'

RSpec.feature 'Creating Posts' do
  scenario 'Guest can\'t crerate post' do
    visit root_path
  end

  scenario 'Site admin crerate post' do
    visit root_path
    visit blog_path
    click_link 'New Post'
    fill_in 'post_title', with: 'Post title'
    fill_in 'post_body', with: 'Lorem Ipsum dolor est asedo fiedo umbro.'
    click_button 'Submit'

    expect(page).to have_content('Post has been created')
    expect(page.current_page).to eq(blog_path)
  end
end
