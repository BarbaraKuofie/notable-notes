class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.string :title
      t.string :content
      t.string :owner
      t.string :icon 
      t.integer :helpful 
      t.integer :unhelpful 
      t.integer :user_id
    

      t.timestamps
    end
  end
end
