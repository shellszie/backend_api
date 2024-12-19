class CreateVerifications < ActiveRecord::Migration[8.0]
  def change
    create_table :verifications do |t|
      t.string :email
      t.string :code

      t.timestamps
    end
  end
end
