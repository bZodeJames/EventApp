class Event < ApplicationRecord
    enum event_type: { public_event: 0, private_event: 1}
    mount_uploader :main_image, MainImageUploader
end
