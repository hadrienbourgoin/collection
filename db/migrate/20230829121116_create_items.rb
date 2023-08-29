class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.references :compilation, null: false, foreign_key: true
      t.string :description
      t.integer :year
      t.boolean :owned

      t.timestamps
    end
  end
end
