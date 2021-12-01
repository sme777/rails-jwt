class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users, :id => false do |t|
      t.string :email, :primary_key => true
      t.string :password
      t.string :firstName
      t.string :lastName
    end
  end
end
