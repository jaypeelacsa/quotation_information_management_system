class AddColumnToCheckParticular < ActiveRecord::Migration
  add_column(:check_particulars, :amount_in_word, :string)
end
