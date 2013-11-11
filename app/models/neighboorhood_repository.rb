class NeighboorhoodRepository < ActiveRecord::Base
  has_many :suite_repositories, foreign_key: :neighboorhood_id
end
