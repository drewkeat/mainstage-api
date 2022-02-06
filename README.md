# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# NOTES
TODO: Build remaining resources and relationships
- User (.managed_productions, .roles, .productions, .applications)
  - has_many :productions_managers, foreign_key: :manager_id
  - has_many :managed_productions, through: :productions_managers, source: :managed_production
  - has_many :roles
  - has_many :productions, through: :roles
  - has_many :applications
- Application (.user, .role, .production)
  - belongs_to :user
  - belongs_to :production
  - belongs_to :role
- Role (.production, .user, .applications, .applicants)
  - belongs_to :production
  - belongs_to :user, optional: true
  - has_many :applications
  - has_many :applicants, through: :applications, source: :user
- Production (.managers, .roles, .company_members, .applications, .applicants)
  - has_many :productions_managers, foreign_key: :managed_production_id
  - has_many :managers, through: :productions_managers, source: :manager
  - has_many :roles
  - has_many :company_members, through: :roles, source: :user
  - has_many :applications
  - has_many :applicants, through: :applications, source: :user
- Productions_Managers (.manager, .managed_production)
  - belongs_to :manager, class_name: "User"
  - belongs_to :managed_production, class_name: "Production"
- Rehearsal
- Schedulable
