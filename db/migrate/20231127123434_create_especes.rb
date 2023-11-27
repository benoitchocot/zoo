class CreateEspeces < ActiveRecord::Migration[7.1]
  def change
    create_table :especes do |t|
      t.string :nom
      t.boolean :sociable
      t.text :observations
      t.boolean :dangeureux
      t.string :enclos

      t.timestamps
    end
  end
end
