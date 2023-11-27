class CreateEnclos < ActiveRecord::Migration[7.1]
  def change
    create_table :enclos do |t|
      t.string :__id
      t.string :nom
      t.string :zone
      t.string :coordonnees
      t.string :superficie
      t.string :__t
      t.integer :temperatureMini
      t.integer :temperatureMaxi
      t.integer :hygrometrie
      t.integer :temperature

      t.timestamps
    end
  end
end
