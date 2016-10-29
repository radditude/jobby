Models/tables:

Users
-username
-email
-password
-has_many :companies
-has_many :potential_jobs, through: :companies
-has_many :contacts, through: :companies

Company
-has_many :potential_jobs
-has_many :contacts
-belongs_to :user
-name
-website
-user_id

PotentialJobs
-belongs_to: company
-company_id
-job_title
-timestamp
-link
-applied? (boolean)
-heard_back? (boolean)
-interview? (boolean)
-notes

Contacts
-belongs_to :company
-company_id
-name
-email
-phone_number
