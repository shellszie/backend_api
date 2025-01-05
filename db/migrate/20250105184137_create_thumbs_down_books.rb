class CreateThumbsDownBooks < ActiveRecord::Migration[8.0]
  def change
    create_table :thumbs_down_books do |t|
      t.integer :user_id
      t.string :isbn

      t.timestamps
    end
  end
end
