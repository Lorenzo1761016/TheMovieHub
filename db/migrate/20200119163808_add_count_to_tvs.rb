class AddCountToTvs < ActiveRecord::Migration[6.0]
  def change
    add_column :tvs, :visits, :integer, default: 1
  end
end
