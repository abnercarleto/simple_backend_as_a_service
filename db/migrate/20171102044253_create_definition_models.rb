class CreateDefinitionModels < ActiveRecord::Migration[5.1]
  def change
    create_table :definition_models do |t|
      t.string :name, null: false

      t.timestamps
    end
    add_index :definition_models, :name, unique: true
  end
end
