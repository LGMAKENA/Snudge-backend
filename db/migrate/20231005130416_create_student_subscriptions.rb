class CreateStudentSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :student_subscriptions do |t|

      t.timestamps
    end
  end
end
