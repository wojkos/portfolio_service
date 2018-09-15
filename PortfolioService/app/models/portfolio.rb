class Portfolio < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  validates_presence_of :title, :body, :main_image, :thumb_image

  scope :ruby_on_rails_portfolio_items, -> { where(subtitle: 'Ruby on Rails') }

  after_initialize :set_defaults_images

  def set_defaults_images
    self.main_image ||= 'http://placehold.it/600x400'
    self.thumb_image ||= 'http://placehold.it/350x200'
  end
end
