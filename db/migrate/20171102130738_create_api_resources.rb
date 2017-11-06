class CreateApiResources < ActiveRecord::Migration[5.1]
  def change
    create_table :api_resources do |t|
      t.references :definition_model, foreign_key: true, null: false
      t.jsonb :content, null: false

      t.timestamps
    end
  end
end
