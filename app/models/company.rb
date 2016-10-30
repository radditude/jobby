class Company < ActiveRecord::Base
  belongs_to :user
  has_many :potential_jobs
  has_many :contacts
  validates_presence_of :name
end
