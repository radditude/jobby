class User < ActiveRecord::Base
  has_many :companies
  has_many :potential_jobs, through: :companies
  has_many :contacts, through: :companies
  has_secure_password
end
