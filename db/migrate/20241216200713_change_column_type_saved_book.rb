class ChangeColumnTypeSavedBook < ActiveRecord::Migration[8.0]
  def change
    change_column :saved_books, :isbn, 'bigint USING isbn::bigint'
  end
end
