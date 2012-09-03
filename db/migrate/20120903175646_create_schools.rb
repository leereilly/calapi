class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.integer :district_id
      t.string :name
      t.timestamps
    end
  end
end
