class CreateStudentSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :student_subscriptions do |t|
      t.references :user,foreign_key: true 
      t.references :content,foreign_key: true 
      t.timestamps
    end
  end
end
