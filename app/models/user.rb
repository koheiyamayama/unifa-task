class User < ApplicationRecord
  has_secure_password

  has_many :pictures

  class << self
    def login?(user_id)
      exists?(id: user_id)
    end
  end
end
