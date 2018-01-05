class Event < ApplicationRecord
    has_many :registrations
    has_many :users, :through => :registrations
    belongs_to :user

    enum event_type: { public_event: 0, private_event: 1}
    mount_uploader :main_image, MainImageUploader
end
