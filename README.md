# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

Dependencies
-------

 - Ruby 2.6.3
 - Rails 6.0.2.2
 - PostgreSQL 11.7
 - Bundler 2.1.4

Configuration
-------

```
hhm/
└── config/
    └── database.yml -> DB variables here
```

* Database creation
`$ bundle exec rake db:create`

* Database initialization
`$ bundle exec rake db:migrate`

* How to run the test suite

# Default: Run all spec files
`$ bundle exec rspec`

# Run all spec files in a single directory (recursively)
`$ bundle exec rspec spec/models`
