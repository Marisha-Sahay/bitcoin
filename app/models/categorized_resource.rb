class CategorizedResource < ApplicationRecord
  belongs_to :resource
  belongs_to :resource_category
end
