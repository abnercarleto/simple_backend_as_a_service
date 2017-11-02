class Definition::Attribute < ApplicationRecord
  belongs_to :definition_model,
             class_name: 'Definition::Model',
             foreign_key: :definition_model_id,
             dependent: :destroy

  as_enum :kind, %i[int decimal string date datetime]

  validates :name, :kind, presence: true
  validates :name, uniqueness: { scope: :definition_model_id }
end
