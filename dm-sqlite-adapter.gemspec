# -*- encoding: utf-8 -*-
require File.expand_path('../lib/dm-sqlite-adapter/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name        = 'dm-sqlite-adapter'
  gem.summary     = 'Sqlite3 Adapter for DataMapper'
  gem.description = gem.summary
  gem.email       = 'dan.kubb@gmail.com'
  gem.homepage    = 'http://datamapper.org'
  gem.authors     = [ 'Dan Kubb' ]

  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {spec}/*`.split("\n")
  gem.extra_rdoc_files = %w[LICENSE]

  gem.require_paths = [ "lib" ]
  gem.version       = DataMapper::SqliteAdapter::VERSION

  gem.add_runtime_dependency(%q<dm-do-adapter>, ["~> 1.3.0.beta"])

  gem.add_runtime_dependency(%q<do_sqlite3>, ["~> 0.10.6"])
  gem.add_runtime_dependency(%q<dm-do-adapter>, ["~> 1.3.0.beta"])

  gem.add_development_dependency(%q<dm-migrations>, ["~> 1.3.0.beta"])
  gem.add_development_dependency(%q<rspec>, ["~> 1.3.2"])
end
