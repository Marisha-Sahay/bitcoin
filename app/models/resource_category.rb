class ResourceCategory < ApplicationRecord
  has_many :categorized_resources
  has_many :resources, through: :categorized_resources
end
