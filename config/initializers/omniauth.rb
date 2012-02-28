Rails.application.config.middleware.use OmniAuth::Builder do
  
  provider :facebook, "211725688893977", "7e9559fc95b3cdc10e64669d3b524290", {client_options: {ssl: {ca_file: Rails.root.join('lib/assets/cacert.pem').to_s}}}

  #provider :facebook, "211725688893977", "7e9559fc95b3cdc10e64669d3b524290", :iframe => true, :scope =>'email, user_about_me, user_activities, user_birthday, friends_about_me, friends_activities, friends_birthday, friends_groups, friends_interests, friends_like'

end