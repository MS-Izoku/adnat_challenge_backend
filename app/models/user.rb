class User < ApplicationRecord
    has_secure_password

    belongs_to :organization, optional: true
    has_many :shifts

    validates :email , uniqueness: true, presence: true
end
