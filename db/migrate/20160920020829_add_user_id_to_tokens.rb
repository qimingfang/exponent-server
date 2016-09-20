class AddUserIdToTokens < ActiveRecord::Migration
  def change
    add_column :Token, :user_id, :string
  end
end
