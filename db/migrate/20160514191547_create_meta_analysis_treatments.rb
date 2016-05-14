class CreateMetaAnalysisTreatments < ActiveRecord::Migration
  def change
    create_table :meta_analysis_treatments do |t|
      t.references :meta_analysis, index: true, foreign_key: true, null: false
      t.references :treatment, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
