class CreateEmailBooks < ActiveRecord::Migration[8.0]
  def change
    create_table :email_books do |t|
      t.integer :user_id
      t.string :title
      t.string :author
      t.string :img_url
      t.string :isbn
      t.string :preview_url

      t.timestamps
    end
  end
end
