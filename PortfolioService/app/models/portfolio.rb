class Portfolio < ApplicationRecord
  include Placeholder
  extend FriendlyId
  friendly_id :title, use: :slugged
  has_many :technologies
  accepts_nested_attributes_for :technologies, 
                                reject_if: lambda { |x| x['name'].blank? }

  validates_presence_of :title, :body, :main_image, :thumb_image

  mount_uploader :thumb_image, PortfolioUploader
  mount_uploader :main_image, PortfolioUploader

  scope :ruby_on_rails_portfolio_items, -> { where(subtitle: 'Ruby on Rails') }

  after_initialize :set_defaults_images
  
  def self.by_position
    order('position ASC')
  end

  def set_defaults_images
    self.main_image ||= Placeholder.image_generator(600, 400)
    self.thumb_image ||= Placeholder.image_generator(300, 200)
  end
end
