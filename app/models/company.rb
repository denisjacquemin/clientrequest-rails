class Company < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :forms, dependent: :destroy
end
