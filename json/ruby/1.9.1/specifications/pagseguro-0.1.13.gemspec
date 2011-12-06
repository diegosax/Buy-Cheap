# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "pagseguro"
  s.version = "0.1.13"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Nando Vieira"]
  s.date = "2011-11-17"
  s.description = "The official PagSeguro library"
  s.email = ["fnando.vieira@gmail.com"]
  s.homepage = "http://rubygems.org/gems/pagseguro"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.11"
  s.summary = "The official PagSeguro library"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rails>, ["~> 3.1"])
      s.add_development_dependency(%q<rake>, ["~> 0.9"])
      s.add_development_dependency(%q<fakeweb>, ["~> 1.3"])
      s.add_development_dependency(%q<rspec-rails>, ["~> 2.7"])
      s.add_development_dependency(%q<nokogiri>, ["~> 1.5"])
      s.add_development_dependency(%q<sqlite3>, ["~> 1.3"])
    else
      s.add_dependency(%q<rails>, ["~> 3.1"])
      s.add_dependency(%q<rake>, ["~> 0.9"])
      s.add_dependency(%q<fakeweb>, ["~> 1.3"])
      s.add_dependency(%q<rspec-rails>, ["~> 2.7"])
      s.add_dependency(%q<nokogiri>, ["~> 1.5"])
      s.add_dependency(%q<sqlite3>, ["~> 1.3"])
    end
  else
    s.add_dependency(%q<rails>, ["~> 3.1"])
    s.add_dependency(%q<rake>, ["~> 0.9"])
    s.add_dependency(%q<fakeweb>, ["~> 1.3"])
    s.add_dependency(%q<rspec-rails>, ["~> 2.7"])
    s.add_dependency(%q<nokogiri>, ["~> 1.5"])
    s.add_dependency(%q<sqlite3>, ["~> 1.3"])
  end
end
