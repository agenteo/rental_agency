class CreateNeighboorhoodRepositories < ActiveRecord::Migration
  def change
    create_table :neighboorhood_repositories do |t|
      t.string :name
      t.integer :city_id

      t.timestamps
    end
  end
end
