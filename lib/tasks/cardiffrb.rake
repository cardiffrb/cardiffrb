namespace :cardiffrb do
  desc 'Update twitter avatar URLs'
  task update_avatar: :environment do
    User.with_custom_avatar.each do |user|
      user.update_attributes image_url: user.image_url.sub('a0.twimg.com', 'pbs.twimg.com')
    end
  end
end
