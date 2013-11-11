class CreateProvinceRepositories < ActiveRecord::Migration
  def change
    create_table :province_repositories do |t|
      t.string :name

      t.timestamps
    end
  end
end
