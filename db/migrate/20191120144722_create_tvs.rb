class CreateTvs < ActiveRecord::Migration[6.0]
  def change
    create_table :tvs do |t|
      t.string :tv_id

      t.timestamps
    end
  end
end
