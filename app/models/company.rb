class Company < ActiveRecord::Base
  belongs_to :user
  has_many :potential_jobs
  has_many :contacts
end
