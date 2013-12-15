class Event < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader

  validates :title, :description, :avatar, :presence => true
  validates :price, :sell_price, :numericality => {:only_integer => true}
  has_many :orders
  has_many :users, :through => :orders
end
