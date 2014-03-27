class CreateWalletoneTable < ActiveRecord::Migration
  def self.up
    create_table :walletrecords do |t|
      t.decimal :payment_amount, :nil => false
      t.integer :currency_code, :nil => false
      t.integer :payment_id, :nil => false
      t.integer :walletone_id, :nil => false
      t.text :description, :nil => false
      t.timestamp :expired_date, :nil => false
      t.string :state, :nil => false, :default => 'not_paid'
      t.timestamps
    end
    add_index :walletone, :payment_id
    add_index :walletone, :walletone_id
  end

  def self.down
    drop_table :walletone
  end
end
