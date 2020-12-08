class User < ApplicationRecord
    has_secure_password  
    has_many :notes 
    validates :username, uniqueness: { case_sensitive: false }
   
    #we can also use the below instead of has_secure_password
    # def self.from_token_payload(payload)
    #     self.find payload["sub"]
    #   end
  
end
