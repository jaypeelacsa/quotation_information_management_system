class CheckParticular < ActiveRecord::Base

	validates :particular, presence: true
	validates :amount, presence: true
  validates :amount_in_word, presence: true
	
	belongs_to :check_voucher

end
