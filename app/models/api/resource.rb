class Api::Resource < ApplicationRecord
  belongs_to :definition_model,
             class_name: 'Definition::Model',
             foreign_key: :definition_model_id,
             dependent: :destroy

  validates :definition_model_id, :content, presence: true
end
