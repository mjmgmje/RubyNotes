class User < ApplicationRecord
    has_secure_password
    validates :username, presence:true
    validates :password, presence:true
    validates :user_role, inclusion: { :in => ["teamMember", "admin"]}
end
