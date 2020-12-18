class Ad < ApplicationRecord
    resourcify
    has_one_attached :content
    belongs_to :shared_ads
    has_many :validations
    belongs_to :user
    has_many :share_requests
end
