class Skill < ApplicationRecord
  validates_presence_of :title, :skill_percent
end
