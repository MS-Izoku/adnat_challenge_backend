class Organization < ApplicationRecord
    has_many :users
    has_many :shifts ,through: :users
end
