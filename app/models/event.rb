class Event < ActiveRecord::Base
  validates :title, :description, :presence => true
  validates :price, :sell_price, :numericality => {:only_integer => true}
  has_many :orders
  has_many :users, :through => :orders
end
