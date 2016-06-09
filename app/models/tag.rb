class Tag < ApplicationRecord
    has_and_belongs_to_many :videos
    has_and_belongs_to_many :users
end
