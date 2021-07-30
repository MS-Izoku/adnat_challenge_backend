class Break < ApplicationRecord
    after_create :duration
    after_update :duration

    belongs_to :shift, dependent: :destroy
    has_one :user, through: :shift
end
