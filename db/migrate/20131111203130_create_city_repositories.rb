class CreateCityRepositories < ActiveRecord::Migration
  def change
    create_table :city_repositories do |t|
      t.string :name
      t.integer :province_id

      t.timestamps
    end
  end
end
