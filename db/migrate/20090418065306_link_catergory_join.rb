class LinkCatergoryJoin < ActiveRecord::Migration
  def self.up
    create_table :catergories_links, :id => false do |t|
      t.integer :category_id
      t.integer :link_id
    end
  end

  def self.down
  end
end
