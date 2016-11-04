class Company < ActiveRecord::Base
  belongs_to :user
  has_many :potential_jobs
  validates_presence_of :name

  def slug
    self.name.downcase.gsub(" ", "-").gsub(/[^\w-]/, '').squeeze('-')
  end

  def self.find_by_slug(slug)
    self.all.find do |object|
      object.name.downcase.gsub(" ", "-").gsub(/[^\w-]/, '') == slug
    end
  end
end
