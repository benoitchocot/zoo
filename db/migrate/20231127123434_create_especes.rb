class CreateEspeces < ActiveRecord::Migration[7.1]
  def change
    create_table :especes do |t|
      t.string :__id
      t.string :nom
      t.boolean :sociable
      t.text :observations
      t.boolean :dangereux
      t.string :enclos

      t.timestamps
    end
  end
end
