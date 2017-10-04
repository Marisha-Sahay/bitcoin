class Resource < ApplicationRecord
  has_many :categorized_resources
  has_many :resource_categories, through: :categorized_resources
  acts_as_votable
end
