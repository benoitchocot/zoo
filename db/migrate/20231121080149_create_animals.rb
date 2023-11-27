class CreateAnimals < ActiveRecord::Migration[7.1]
  def change
    create_table :animals do |t|
      t.string :_id
      t.string :nom
      t.string :espece
      t.date :naissance
      t.date :deces
      t.string :sexe
      t.string :observations
      t.string :position

      t.timestamps
    end
  end
end
