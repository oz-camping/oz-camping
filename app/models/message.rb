class Message < ActiveRecord::Base

  validates_presence_of :name, :body
  validates_format_of :email, :with => /^(\S+)@(\S+)\.(\S+)$/

end
