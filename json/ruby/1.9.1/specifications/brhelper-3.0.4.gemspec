# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{brhelper}
  s.version = "3.0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Marcos TapajÃ³s", "Celestino Gomes", "Andre Kupkosvki", "VinÃ­cius Teles", "Felipe Barreto", "Rafael Walter", "Cassio Marques"]
  s.date = %q{2011-03-01}
  s.description = %q{brhelper Ã© uma das gems que compoem o Brazilian Rails}
  s.email = ["tapajos@gmail.com", "tinorj@gmail.com", "kupkovski@gmail.com", "vinicius.m.teles@gmail.com", "felipebarreto@gmail.com", "rafawalter@gmail.com", "cassiommc@gmail.com"]
  s.homepage = %q{http://www.improveit.com.br/software_livre/brazilian_rails}
  s.require_paths = ["lib"]
  s.requirements = ["none"]
  s.rubyforge_project = %q{brhelper}
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{brhelper Ã© uma das gems que compoem o Brazilian Rails}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<actionpack>, [">= 3.0.0"])
      s.add_runtime_dependency(%q<activesupport>, [">= 3.0.0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<mocha>, [">= 0"])
    else
      s.add_dependency(%q<actionpack>, [">= 3.0.0"])
      s.add_dependency(%q<activesupport>, [">= 3.0.0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<mocha>, [">= 0"])
    end
  else
    s.add_dependency(%q<actionpack>, [">= 3.0.0"])
    s.add_dependency(%q<activesupport>, [">= 3.0.0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<mocha>, [">= 0"])
  end
end
