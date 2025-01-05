class AddTitleAuthorToThumbsDownBooks < ActiveRecord::Migration[8.0]
  def change
    add_column :thumbs_down_books, :title, :string
    add_column :thumbs_down_books, :author, :string
  end
end
