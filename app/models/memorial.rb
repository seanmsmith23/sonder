class Memorial < ActiveRecord::Base
  validates :name, :born, :died, presence: true
end
