require 'capistrano/setup'
require 'capistrano/deploy'
require 'capistrano/rbenv'

set :rbenv_type, :user
set :rbenv_ruby, '2.2.1'

require 'capistrano/bundler'
require 'capistrano/rails/assets'
require 'capistrano/rails/migrations'

require 'capistrano3/unicorn'

# タスク読み込みも可能
#Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
Dir.glob('lib/capistrano/tasks/*.cap').each { |r| import r }
