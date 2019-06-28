class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.integer :number
      t.string :title
      t.integer :messages_count, :default => 0

      t.references :application, foreign_key: true

      t.timestamps
    end
    add_index :chats, [:number, :application_id], unique: true
  end
end
