class CreateShifts < ActiveRecord::Migration[6.0]
  def change
    create_table :shifts do |t|
      t.datetime :start
      t.datetime :finish
      t.float :break_length
      t.integer :user_id
    end
  end
end
