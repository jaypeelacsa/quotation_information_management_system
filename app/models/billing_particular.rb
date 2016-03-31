class BillingParticular < ActiveRecord::Base

 	validates :particular, presence: true
  validates :currency, presence: true
  validates :amount, presence: true

	belongs_to :billing
end
