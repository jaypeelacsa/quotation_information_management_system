class PettyParticular < ActiveRecord::Base

	validates :particular, presence: true
	validates :amount, presence: true
	

	belongs_to :petty_voucher
end
