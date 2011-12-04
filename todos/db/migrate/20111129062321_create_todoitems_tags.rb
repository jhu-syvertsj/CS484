class CreateTodoitemsTags < ActiveRecord::Migration
  def self.up
    #create_table :todoitems_tags, id: false do |t|
    create_table :tags_todoitems, id: false do |t|
      t.references :todoitem
      t.references :tag
    end
  end

  def self.down
    #drop_table :todoitems_tags
    drop_table :tags_todoitems
  end
end
