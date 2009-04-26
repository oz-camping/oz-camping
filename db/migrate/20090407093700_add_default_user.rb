class AddDefaultUser < ActiveRecord::Migration
  def self.up
    if !User.find_by_login('admin')
      User.create(:login => 'admin', :email => 'info@holmstroms.eu', :password => '123', :password_confirmation => '123')
    end
  end

  def self.down
  end
end
