require 'pathname'

source 'https://rubygems.org'

gemspec

SOURCE = ENV.fetch('SOURCE', :git).to_sym
REPO_POSTFIX = SOURCE == :path ? '' : '.git'
DATAMAPPER = (SOURCE == :path) ? Pathname(__FILE__).dirname.parent : 'https://github.com/firespring'
DM_VERSION = '~> 1.3.0.beta'
DO_VERSION = '~> 0.10.17'
CURRENT_BRANCH = ENV.fetch('GIT_BRANCH', 'master')

options = {}
options[:branch] = CURRENT_BRANCH unless SOURCE == :path

do_options = {}
# DO_GIT is for the DataObjects repo which is not managed with thor in the same way as the rest of the gems. It is possible to have SOURCE configured
# as path while datamapper-do should use git. Configure these options separately.
if ENV['DO_GIT'] == 'true'
  do_options[:branch] = CURRENT_BRANCH
  do_options[:git] = "#{DATAMAPPER}/datamapper-do#{REPO_POSTFIX}"
end

gem 'sbf-do_sqlite3', DO_VERSION, do_options.dup

options[SOURCE] = "#{DATAMAPPER}/dm-do-adapter#{REPO_POSTFIX}"
gem 'sbf-dm-do-adapter', DM_VERSION, options.dup

group :development do
  options[SOURCE] = "#{DATAMAPPER}/dm-migrations#{REPO_POSTFIX}"
  gem 'sbf-dm-migrations', DM_VERSION, options.dup
end

platforms :mri_18 do
  group :quality do

    gem 'rcov',      '~> 0.9.9'
    gem 'yard',      '~> 0.6'
    gem 'yardstick', '~> 0.2'

  end
end

group :datamapper do

  options[SOURCE] = "#{DATAMAPPER}/dm-core#{REPO_POSTFIX}"
  gem 'sbf-dm-core', DM_VERSION, options.dup

  gem 'sbf-data_objects', DO_VERSION, do_options.dup

  plugins = ENV['PLUGINS'] || ENV['PLUGIN']
  plugins = plugins.to_s.tr(',', ' ').split.push('dm-migrations').uniq

  plugins.each do |plugin|
    options[SOURCE] = "#{DATAMAPPER}/#{plugin}#{REPO_POSTFIX}"
    gem "sbf-#{plugin}", DM_VERSION, options.dup
  end

end
