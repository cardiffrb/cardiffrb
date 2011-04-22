class ChangeScreenNameToNickname < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.rename :screen_name, :nickname
    end
  end

  def self.down
    change_table :users do |t|
      t.rename :nickname, :screen_name
    end
  end
end
