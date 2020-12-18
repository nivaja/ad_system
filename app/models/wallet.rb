class Wallet < ApplicationRecord
  resourcify
  belongs_to :user
end
