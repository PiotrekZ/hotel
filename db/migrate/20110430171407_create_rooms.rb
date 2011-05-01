class CreateRooms < ActiveRecord::Migration
  def self.up
    create_table :rooms do |t|
      t.integer :typ
      t.float :cena
      t.boolean :lazienka
      t.boolean :aneks_kuchenny
      t.boolean :minibarek
      t.boolean :sejf
      t.boolean :telewizor
      t.boolean :telefon
      t.boolean :radio

      t.timestamps
    end
  end

  def self.down
    drop_table :rooms
  end
end
