class Skill < ApplicationRecord
  include Placeholder
  validates_presence_of :title, :skill_percent

  after_initialize :set_defaults_images

  def set_defaults_images
    self.badge ||= Placeholder.image_generator(250, 250)
  end
end
