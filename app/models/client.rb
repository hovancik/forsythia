class Client < ActiveRecord::Base
  belongs_to :user
  validates :name, presence: true
  validates :rate, presence: true
end
