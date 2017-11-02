class CreateDefinitionAttributes < ActiveRecord::Migration[5.1]
  def change
    create_table :definition_attributes do |t|
      t.string :name, null: false
      t.integer :kind_cd, null: false
      t.references :definition_model, foreign_key: true, null: false

      t.timestamps
    end
    add_index :definition_attributes, :name
  end
end
