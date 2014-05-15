class AddComfirmableFields < ActiveRecord::Migration
  def change
    add_column :users, :confirmaton_token, :string
    add_column :users, :confirmed_at, :datetime
    add_column :users, :confirmaton_sent_at, :datetime
  end
end
