class AddSlugToDefinitionModels < ActiveRecord::Migration[5.1]
  def change
    add_column :definition_models, :slug, :string, index: true, null: false
  end
end
