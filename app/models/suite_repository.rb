class SuiteRepository < ActiveRecord::Base
  belongs_to :neighboorhood_repository, :foreign_key => :neighboorhood_id
end
