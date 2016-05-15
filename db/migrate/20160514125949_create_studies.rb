class CreateStudies < ActiveRecord::Migration
  def change
    create_table :studies do |t|
      t.string :name, null: false
      t.string :authors, null: false
      t.integer :year, null: false

      t.timestamps null: false
    end
  end
end
