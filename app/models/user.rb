class User < ActiveRecord::Base
  # write associations here
  has_secure_password
end
