class CreateBreaks < ActiveRecord::Migration[6.0]
  def change
    create_table :breaks do |t|
      t.integer :shift_id
      t.float :duration
    end
  end
end
