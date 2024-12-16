class CreateSavedBooks < ActiveRecord::Migration[8.0]
  def change
    create_table :saved_books do |t|
      t.string :title
      t.string :author
      t.string :isbn
      t.string :img_url

      t.timestamps
    end
  end
end
