class ChangeUserIdToEmailInVerification < ActiveRecord::Migration[8.0]
  def change
    change_column :verifications, :user_id, :string
  end
end
