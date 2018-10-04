class Portfolio < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  has_many :technologies
  accepts_nested_attributes_for :technologies, 
                                reject_if: lambda { |x| x['name'].blank? }

  validates_presence_of :title, :body

  mount_uploader :thumb_image, PortfolioUploader
  mount_uploader :main_image, PortfolioUploader

  scope :ruby_on_rails_portfolio_items, -> { where(subtitle: 'Ruby on Rails') }
  
  def self.by_position
    order('position ASC')
  end
end
