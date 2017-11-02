class Definition::Model < ApplicationRecord
  has_many :definition_attributes,
           class_name: 'Definition::Attribute',
           inverse_of: :definition_model

  validates :name,
            presence: true,
            uniqueness: true

  accepts_nested_attributes_for :definition_attributes, allow_destroy: true, reject_if: :blank?
end
