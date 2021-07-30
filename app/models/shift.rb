class Shift < ApplicationRecord
    # destroy shifts when the target user is no longer in the DB
    before_create :calculate_duration , :set_organization_id , :set_name
    before_update :check_duration , :set_organization_id

    belongs_to :user, dependent: :destroy
    has_many :breaks

    # go from ms to hours
    def get_duration
        ((finish - start) / 60 / 60) - (break_length / 60)
    end
    
    # used to calculate
    def calculate_duration
        tar = get_duration
        self.duration = tar
    end

    # set the duration if it doesn't match up with existing data
    def check_duration
        calculate_duration if self.duration != get_duration
    end

    # set the organization_id to that of this shift's user automatically
    def set_organization_id
        self.organization_id = self.user.organization_id
    end

    def set_name
        user = User.find_by(id: self.user_id)
        self.name = user.name unless user.nil?
    end
end
