require 'rails_helper'

RSpec.feature 'Showing an post' do
  before do
    @published_post = Post.create!(title: 'Published post', body: 'Lorem ipsum body', status: :published)
    @draft_post =  Post.create!(title: 'Not published post', body: 'Lorem ipsum body')
  end

  scenario 'A Guest User see only published post' do
    visit root_path
    visit blog_path
  end

end