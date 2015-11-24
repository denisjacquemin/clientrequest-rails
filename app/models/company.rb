class Company < ActiveRecord::Base
  has_many :users, dependent: :destroy
  has_many :forms, dependent: :destroy
end
