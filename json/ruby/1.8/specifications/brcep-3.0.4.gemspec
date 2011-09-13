# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{brcep}
  s.version = "3.0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Marcos Tapaj\303\263s", "Celestino Gomes", "Andre Kupkosvki", "Vin\303\255cius Teles", "Felipe Barreto", "Rafael Walter", "Cassio Marques"]
  s.date = %q{2011-03-01}
  s.description = %q{brcep é uma das gems que compoem o Brazilian Rails}
  s.email = ["tapajos@gmail.com", "tinorj@gmail.com", "kupkovski@gmail.com", "vinicius.m.teles@gmail.com", "felipebarreto@gmail.com", "rafawalter@gmail.com", "cassiommc@gmail.com"]
  s.files = ["Rakefile", "README", "CHANGELOG", "MIT-LICENSE", "lib/brcep/busca_endereco.rb", "lib/brcep/version.rb", "lib/brcep.rb", "test/busca_endereco_test.rb", "test/mocks/zip_04006000_bronze_business.xml", "test/mocks/zip_20230024_buscar_cep.xml", "test/mocks/zip_22640100.xml", "test/mocks/zip_22640100_bronze_business.xml", "test/mocks/zip_22640100_buscar_cep.xml", "test/mocks/zip_invalid.xml", "test/mocks/zip_not_found_bronze_business.xml", "test/mocks/zip_not_found_buscar_cep.xml", "test/test_helper.rb"]
  s.homepage = %q{http://www.improveit.com.br/software_livre/brazilian_rails}
  s.require_paths = ["lib"]
  s.requirements = ["none"]
  s.rubyforge_project = %q{brcep}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{brcep é uma das gems que compoem o Brazilian Rails}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<mocha>, [">= 0"])
    else
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<mocha>, [">= 0"])
    end
  else
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<mocha>, [">= 0"])
  end
end
