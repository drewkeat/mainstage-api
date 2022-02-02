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
- User (.applications, .managed_productions, .productions, .roles)
  - has_many :productions_managers, foreign_key: :production_manager_id
  - has_many :managed_productions, through: :productions_managers
  - has_many :productions, through: :roles
  - has_many :roles
  - has_many :applications
- Application (.user, .role)
  - belongs_to :user
  - belongs_to :role
- Role (.applications, .production, .company_member )
  - has_many :applications
  - belongs_to :production
  - belongs_to :company_member, class_name: "User"
- Production (.roles, .production_managers, .company_members)
  - has_many :roles
  - has_many :productions_managers, foreign_key: :managed_production_id
  - has_many :production_managers, through: :productions_managers
  - has_many :company_members, through: :roles
- Productions_Managers
  - belongs_to :managed_production, class_name: "Production"
  - belongs_to :production_manager, class_name: "User"
- Rehearsal
- Schedulable
