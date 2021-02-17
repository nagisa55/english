class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.text :profile
      t.string :email
      t.string :password_digest
      t.text :good_point

      t.timestamps
    end
  end
end
