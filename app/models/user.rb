class User < ActiveRecord::Base

  scope :with_custom_avatar, lambda { where("image_url NOT LIKE 'http://a0.twimg.com/sticky/%'") }

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.nickname = auth["info"]["nickname"]
      user.description = auth["info"]["description"]
      user.image_url = auth["info"]["image"]
      user.website = auth["info"]["urls"]["Website"]
    end
  end

end