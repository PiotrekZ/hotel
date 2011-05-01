class CreateReservations < ActiveRecord::Migration
  def self.up
    create_table :reservations do |t|
      t.date :data_poczatkowa
      t.date :data_koncowa
      t.integer :id_klienta
      t.integer :id_pokoju

      t.timestamps
    end
  end

  def self.down
    drop_table :reservations
  end
end
