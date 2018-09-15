class Portfolio < ApplicationRecord
  include Placeholder
  extend FriendlyId
  friendly_id :title, use: :slugged
  has_many :technologies
  validates_presence_of :title, :body, :main_image, :thumb_image

  scope :ruby_on_rails_portfolio_items, -> { where(subtitle: 'Ruby on Rails') }

  after_initialize :set_defaults_images

  def set_defaults_images
    self.main_image ||= Placeholder.image_generator(600, 400)
    self.thumb_image ||= Placeholder.image_generator(300, 200)
  end
end
