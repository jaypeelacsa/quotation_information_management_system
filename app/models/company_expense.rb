class CompanyExpense < ActiveRecord::Base
	validates :name, presence: true
	validates :amount, presence: true
  validates :remarks, presence: true
	validates :exdate, presence: true
	end
