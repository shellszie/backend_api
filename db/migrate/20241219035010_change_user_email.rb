class ChangeUserEmail < ActiveRecord::Migration[8.0]
  def change
    rename_column :verifications, :user_id, :email
  end
end
