class CreateSuiteRepositories < ActiveRecord::Migration
  def change
    create_table :suite_repositories do |t|
      t.string :name
      t.integer :price
      t.integer :square_meters
      t.integer :neighboorhood_id

      t.timestamps
    end
  end
end
