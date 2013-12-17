class Event < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  validates :start_time, :end_time, :presence => true
  validates :title, :description, :avatar, :presence => true
  validates :price, :sell_price, :numericality => {:only_integer => true}
  has_many :orders
  has_many :users, :through => :orders

  def can_order?
    self.start_time < Time.zone.now && Time.zone.now < self.end_time
  end

  

end
