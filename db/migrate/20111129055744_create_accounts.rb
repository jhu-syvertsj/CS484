class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.string :gender
      t.integer :age
      t.string :first_name
      t.string :last_name
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :accounts
  end
end
