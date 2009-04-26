class CreateAreas < ActiveRecord::Migration
  def self.up
    create_table :areas do |t|
      t.string :name
      t.text :body
      t.string :location
      t.string :popuptext

      t.timestamps
    end
  end

  def self.down
    drop_table :areas
  end
end
