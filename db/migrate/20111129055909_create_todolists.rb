class CreateTodolists < ActiveRecord::Migration
  def self.up
    create_table :todolists do |t|
      t.string :list_name
      t.string :list_due_date
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :todolists
  end
end
