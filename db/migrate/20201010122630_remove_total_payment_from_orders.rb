class RemoveTotalPaymentFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :TotalPayment, :integer
  end
end
