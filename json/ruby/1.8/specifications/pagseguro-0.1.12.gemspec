# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{pagseguro}
  s.version = "0.1.12"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Nando Vieira"]
  s.date = %q{2011-06-13}
  s.description = %q{The official PagSeguro library}
  s.email = ["fnando.vieira@gmail.com"]
  s.files = [".gitignore", ".rspec", "Gemfile", "Gemfile.lock", "README.markdown", "Rakefile", "lib/pagseguro.rb", "lib/pagseguro/action_controller.rb", "lib/pagseguro/base.rb", "lib/pagseguro/cacert.pem", "lib/pagseguro/developer_controller.rb", "lib/pagseguro/faker.rb", "lib/pagseguro/generator.rb", "lib/pagseguro/helper.rb", "lib/pagseguro/notification.rb", "lib/pagseguro/order.rb", "lib/pagseguro/railtie.rb", "lib/pagseguro/rake.rb", "lib/pagseguro/routes.rb", "lib/pagseguro/utils.rb", "lib/pagseguro/version.rb", "lib/pagseguro/views/_pagseguro_form.html.erb", "lib/tasks/pagseguro.rake", "pagseguro.gemspec", "spec/controllers/developer_controller_spec.rb", "spec/fixtures/notification.yml", "spec/helpers/helper_spec.rb", "spec/pagseguro/faker_spec.rb", "spec/pagseguro/notification_spec.rb", "spec/pagseguro/order_spec.rb", "spec/pagseguro/pagseguro_spec.rb", "spec/pagseguro/rake_spec.rb", "spec/spec_helper.rb", "spec/support/app/controllers/application_controller.rb", "spec/support/app/models/account.rb", "spec/support/app/models/user.rb", "spec/support/app/views/dashboard/index.erb", "spec/support/app/views/session/new.erb", "spec/support/config/boot.rb", "spec/support/config/database.yml", "spec/support/config/pagseguro.yml", "spec/support/config/routes.rb", "spec/support/log/.gitkeep", "spec/support/matcher.rb", "spec/support/pagseguro-test.yml", "spec/support/tmp/.gitkeep", "spec/support/tmp/pagseguro-test.yml", "templates/config.yml"]
  s.homepage = %q{http://rubygems.org/gems/pagseguro}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{The official PagSeguro library}
  s.test_files = ["spec/controllers/developer_controller_spec.rb", "spec/fixtures/notification.yml", "spec/helpers/helper_spec.rb", "spec/pagseguro/faker_spec.rb", "spec/pagseguro/notification_spec.rb", "spec/pagseguro/order_spec.rb", "spec/pagseguro/pagseguro_spec.rb", "spec/pagseguro/rake_spec.rb", "spec/spec_helper.rb", "spec/support/app/controllers/application_controller.rb", "spec/support/app/models/account.rb", "spec/support/app/models/user.rb", "spec/support/app/views/dashboard/index.erb", "spec/support/app/views/session/new.erb", "spec/support/config/boot.rb", "spec/support/config/database.yml", "spec/support/config/pagseguro.yml", "spec/support/config/routes.rb", "spec/support/log/.gitkeep", "spec/support/matcher.rb", "spec/support/pagseguro-test.yml", "spec/support/tmp/.gitkeep", "spec/support/tmp/pagseguro-test.yml"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rails>, ["~> 3.0"])
      s.add_development_dependency(%q<rake>, ["~> 0.8.7"])
      s.add_development_dependency(%q<fakeweb>, ["~> 1.3.0"])
      s.add_development_dependency(%q<rspec-rails>, ["~> 2.5.0"])
      s.add_development_dependency(%q<nokogiri>, ["~> 1.4.4"])
      s.add_development_dependency(%q<sqlite3-ruby>, ["~> 1.3.3"])
      s.add_development_dependency(%q<ruby-debug19>, [">= 0"])
    else
      s.add_dependency(%q<rails>, ["~> 3.0"])
      s.add_dependency(%q<rake>, ["~> 0.8.7"])
      s.add_dependency(%q<fakeweb>, ["~> 1.3.0"])
      s.add_dependency(%q<rspec-rails>, ["~> 2.5.0"])
      s.add_dependency(%q<nokogiri>, ["~> 1.4.4"])
      s.add_dependency(%q<sqlite3-ruby>, ["~> 1.3.3"])
      s.add_dependency(%q<ruby-debug19>, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>, ["~> 3.0"])
    s.add_dependency(%q<rake>, ["~> 0.8.7"])
    s.add_dependency(%q<fakeweb>, ["~> 1.3.0"])
    s.add_dependency(%q<rspec-rails>, ["~> 2.5.0"])
    s.add_dependency(%q<nokogiri>, ["~> 1.4.4"])
    s.add_dependency(%q<sqlite3-ruby>, ["~> 1.3.3"])
    s.add_dependency(%q<ruby-debug19>, [">= 0"])
  end
end
