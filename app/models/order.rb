class Order < ActiveRecord::Base
  validates :quantity, :book_price, :numericality => {:only_integer => true}
  validates :option_type, presence: true
  belongs_to :user
  belongs_to :event
end