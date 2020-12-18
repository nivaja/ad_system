class Validation < ApplicationRecord
    resourcify
    belongs_to :user
    belongs_to :ad
end
