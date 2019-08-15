class CreateDemos < ActiveRecord::Migration[5.1]
  def change
    create_table :demos do |t|
      t.string :name, null: false
      t.jsonb :resources, null: false, default: []

      t.timestamps
    end
  end
end
