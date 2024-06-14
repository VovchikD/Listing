class ChangeStatusDefaultInListings < ActiveRecord::Migration[7.1]
  def change
    change_column :listings, :status, :integer, default: 0
  end
end
