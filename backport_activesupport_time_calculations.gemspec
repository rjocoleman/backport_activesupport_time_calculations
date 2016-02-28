Gem::Specification.new do |s|
  s.name         = 'backport_activesupport_time_calculations'
  s.authors     = ['Robert Coleman']
  s.email       = ['github@robert.net.nz']
  s.summary     = 'Backport ActiveSupport DateTime Calculations from Rails 5'
  s.description = 'https://github.com/rails/rails/pull/18335'
  s.version     = '1.0.0'

  s.files        = 'backport_activesupport_time_calculations.rb'
  s.require_path = '.'

  s.add_runtime_dependency 'rails'
end
