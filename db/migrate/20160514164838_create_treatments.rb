class CreateTreatments < ActiveRecord::Migration
  def change
    create_table :treatments do |t|
      t.string :description, null: false
      t.float :effect_size, null: false
      t.float :standard_error, null: false
      t.references :study, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
