class CreatePicture < ActiveRecord::Migration[5.2]
  def change
    create_table :pictures do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
    end
  end
end
