class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.integer :age
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :accounts
  end
end
