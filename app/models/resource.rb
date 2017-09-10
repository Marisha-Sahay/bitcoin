class Resource < ApplicationRecord
  has_many :categorized_resources
  has_many :resource_categories, through: :categorized_resources
end
