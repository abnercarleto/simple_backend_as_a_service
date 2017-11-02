class Definition::Model < ApplicationRecord
  has_many :definition_attributes,
           class_name: 'Definition::Attribute',
           foreign_key: :definition_model_id,
           inverse_of: :definition_model,
           dependent: :destroy
 has_many :api_resources,
          class_name: 'Api::Resource',
          foreign_key: :definition_model_id,
          inverse_of: :definition_model,
          dependent: :destroy

  validates :name,
            presence: true,
            uniqueness: true

  accepts_nested_attributes_for :definition_attributes, allow_destroy: true, reject_if: :blank?
end
