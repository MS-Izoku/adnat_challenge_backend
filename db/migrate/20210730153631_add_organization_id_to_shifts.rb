class AddOrganizationIdToShifts < ActiveRecord::Migration[6.0]
  def change
    add_column :shifts, :organization_id, :integer
  end
end
