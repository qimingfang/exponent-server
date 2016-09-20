class AddUserIdToTokens < ActiveRecord::Migration
  def change
    add_column :Tokens, :user_id, :string
  end
end
