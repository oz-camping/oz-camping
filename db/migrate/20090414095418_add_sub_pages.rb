class AddSubPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :parent_id, :integer
    add_column :pages, :navlabel, :string
    add_column :pages, :position, :integer

  end

  def self.down
  end
end
