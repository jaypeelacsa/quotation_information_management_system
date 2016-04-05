class CompanyExpense < ActiveRecord::Base
	validates :name, presence: true
	validates :amount, presence: true
  validates :remarks, presence: true
	validates :exdate, presence: true

	scope :list_of_expenses, -> { order(created_at: :desc) }
end
