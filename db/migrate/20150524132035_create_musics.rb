class CreateMusics < ActiveRecord::Migration
  def change
    create_table :musics do |t|
      t.string :artist
      t.string :songname

      t.timestamps
    end
  end
end
