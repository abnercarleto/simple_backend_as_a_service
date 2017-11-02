class Definition::Model < ApplicationRecord
  has_many :definition_attributes,
           class_name: 'Definition::Attribute',
           inverse_of: :definition_model

  validates :name,
            presence: true,
            uniqueness: true
end
