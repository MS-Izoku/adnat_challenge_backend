class AddDurationToShift < ActiveRecord::Migration[6.0]
  def change
    add_column :shifts, :duration, :float
  end
end
