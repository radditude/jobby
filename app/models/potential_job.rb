class PotentialJob < ActiveRecord::Base
  belongs_to :company
  validates_presence_of :job_title
end
