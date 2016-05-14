class CreateMetaAnalyses < ActiveRecord::Migration
  def change
    create_table :meta_analyses do |t|
      t.string :description, null: false

      t.timestamps null: false
    end
  end
end
