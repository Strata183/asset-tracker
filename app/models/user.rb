class User < ApplicationRecord
    belongs_to :department
    has_many :devices
    has_many :software_licenses
end
