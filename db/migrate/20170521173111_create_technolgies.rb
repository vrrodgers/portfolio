class CreateTechnolgies < ActiveRecord::Migration[5.0]
  def change
    create_table :technolgies do |t|
      t.string :name
      t.references :album, foreign_key: true

      t.timestamps
    end
  end
end
