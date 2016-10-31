All Routes Down! Time to start refining the UI

- get / - loads signup/login splash screen for not logged in users, redirects to index page if not. Potential_jobs index for now, in future I'd like to do a splashier homepage that displays all recent activity, reminders, etc. This is all that users can see if not logged in.
X - get /potentialjobs/index - shows all the jobs, ordered by last update. Just job title, company name, and status. Link to companies index, contacts index, and user settings page. Menu? Search bar??? Leave off jobs with rejected status, just link to them at the bottom.
X - get /potentialjobs/new - form to add job, with options to assign it to an existing company and/or contact (must have the company name for this, since )
X - post /potentialjobs/ - redirects to /potentialjobs/:id
X - get /potentialjobs/:id - full view page - alllllll the details (if they exist), and a link to update/delete if it doesn't exist, as well as linkys to full list.
X - get /potentialjobs/:id/edit - form to edit job, can also add contacts or companies. Also includes delete button.
X - patch /potentialjobs/:id - patch request w/ form info to edit DB entry for job
X - delete /potentialjobs/:id - deletes just the job, not the companies or contacts

X - get /companies/index - all the companies - just names, maybe a note of how many contacts/jobs? with links to full view
X - get /companies/new - form to make a company, assign it to a job or a contact
X - post /companies - creates/updates company/jobs/contacts as needed
X - get /companies/:slug - one company, with all the info, link to edit/delete, add job, add contact
X - get /companies/:id/edit - form to edit
X - patch /companies/:id - pushes edits to company
X - delete /companies/:id

X - get /user/:id - user profile
X - get /signup - signup page
X - post /signup - make new user (logs in and redirects to user home)
X - get /login
X - post /login
X - get /user/edit - edit password, etc
X - patch /user/:id
X - get /user/logout
X - delete /user/:id

https://jobby-radditude.c9users.io
