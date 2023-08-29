class CreateCompilations < ActiveRecord::Migration[7.0]
  def change
    create_table :compilations do |t|
      t.string :name
      t.string :description
      t.boolean :public

      t.timestamps
    end
  end
end
