class Company < ActiveRecord::Base
  belongs_to :user
  has_many :potential_jobs
  has_many :contacts
  validates_presence_of :name

  def slug
    self.name.gsub(" ", "-").downcase
  end

  def self.find_by_slug(slug)
    self.all.find do |object|
      object.name.downcase.gsub(" ", "-") == slug
    end
  end
end
