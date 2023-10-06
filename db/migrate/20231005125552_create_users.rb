class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :username,unique:true
      t.string :email,unique:true
      t.string :role
      t.string :password_digest
      t.string :deactivated, default:false
  

      t.timestamps
    end
  end
end
