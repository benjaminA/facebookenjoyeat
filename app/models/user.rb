class User < ActiveRecord::Base
  has_many :authentications
  
  def self.create_with_omniauth(auth)
  create! do |user|
    #user.first_name = auth["user_info"]["first_name"]
    #user.last_name = auth["user_info"]["last_name"]
    #user.email = auth["user_info"]["email"]
    #user.fb_uid = auth["uid"] 
    #user.fb_token = auth["credentials"]["token"]
    user.provider = auth["provider"]
    user.uid = auth["uid"]
    user.name = auth["info"]["name"]
  end
end
end
