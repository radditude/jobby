class User < ActiveRecord::Base
  has_many :companies
  has_many :potential_jobs, through: :companies
  has_secure_password
  validates_presence_of :username, :email
  validates_uniqueness_of :email
end
