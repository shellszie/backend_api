class CreateSearches < ActiveRecord::Migration[8.0]
  def change
    create_table :searches do |t|
      t.integer :user_id
      t.string :search_term

      t.timestamps
    end
  end
end
