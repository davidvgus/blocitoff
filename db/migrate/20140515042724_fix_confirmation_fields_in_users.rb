class FixConfirmationFieldsInUsers < ActiveRecord::Migration
  def change
    rename_column :users, :confirmaton_token, :confirmation_token
    rename_column :users, :confirmaton_sent_at, :confirmation_sent_at
  end
end
