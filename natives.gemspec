# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: natives 0.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "natives"
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Huiming Teo"]
  s.date = "2013-11-04"
  s.description = "Automate libraries installation required by rubygems' native extension."
  s.email = "teohuiming@gmail.com"
  s.executables = ["natives"]
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    ".document",
    ".rspec",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "VERSION",
    "bin/natives",
    "chef-solo/.kitchen.yml",
    "chef-solo/Berksfile",
    "chef-solo/Berksfile.lock",
    "chef-solo/config.rb",
    "chef-solo/cookbooks/natives/Berksfile",
    "chef-solo/cookbooks/natives/Gemfile",
    "chef-solo/cookbooks/natives/LICENSE",
    "chef-solo/cookbooks/natives/README.md",
    "chef-solo/cookbooks/natives/chefignore",
    "chef-solo/cookbooks/natives/libraries/natives_recipe_helper.rb",
    "chef-solo/cookbooks/natives/metadata.rb",
    "chef-solo/cookbooks/natives/recipes/default.rb",
    "chef-solo/vendored-cookbooks/apt/CHANGELOG.md",
    "chef-solo/vendored-cookbooks/apt/README.md",
    "chef-solo/vendored-cookbooks/apt/attributes/default.rb",
    "chef-solo/vendored-cookbooks/apt/files/default/apt-proxy-v2.conf",
    "chef-solo/vendored-cookbooks/apt/libraries/helpers.rb",
    "chef-solo/vendored-cookbooks/apt/libraries/network.rb",
    "chef-solo/vendored-cookbooks/apt/metadata.json",
    "chef-solo/vendored-cookbooks/apt/metadata.rb",
    "chef-solo/vendored-cookbooks/apt/providers/preference.rb",
    "chef-solo/vendored-cookbooks/apt/providers/repository.rb",
    "chef-solo/vendored-cookbooks/apt/recipes/cacher-client.rb",
    "chef-solo/vendored-cookbooks/apt/recipes/cacher-ng.rb",
    "chef-solo/vendored-cookbooks/apt/recipes/default.rb",
    "chef-solo/vendored-cookbooks/apt/resources/preference.rb",
    "chef-solo/vendored-cookbooks/apt/resources/repository.rb",
    "chef-solo/vendored-cookbooks/apt/templates/debian-6.0/acng.conf.erb",
    "chef-solo/vendored-cookbooks/apt/templates/default/01proxy.erb",
    "chef-solo/vendored-cookbooks/apt/templates/default/acng.conf.erb",
    "chef-solo/vendored-cookbooks/apt/templates/ubuntu-10.04/acng.conf.erb",
    "chef-solo/vendored-cookbooks/homebrew/CHANGELOG.md",
    "chef-solo/vendored-cookbooks/homebrew/README.md",
    "chef-solo/vendored-cookbooks/homebrew/attributes/default.rb",
    "chef-solo/vendored-cookbooks/homebrew/libraries/homebrew_mixin.rb",
    "chef-solo/vendored-cookbooks/homebrew/libraries/homebrew_package.rb",
    "chef-solo/vendored-cookbooks/homebrew/metadata.json",
    "chef-solo/vendored-cookbooks/homebrew/metadata.rb",
    "chef-solo/vendored-cookbooks/homebrew/providers/tap.rb",
    "chef-solo/vendored-cookbooks/homebrew/recipes/default.rb",
    "chef-solo/vendored-cookbooks/homebrew/resources/tap.rb",
    "lib/natives.rb",
    "lib/natives/app.rb",
    "lib/natives/cli.rb",
    "natives.gemspec",
    "spec/natives/app_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = "http://github.com/teohm/natives"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.1.10"
  s.summary = "Install libraries required by rubygems' native extension."

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<chef>, [">= 11.6.2"])
      s.add_runtime_dependency(%q<natives-catalog>, [">= 0.3.1"])
      s.add_runtime_dependency(%q<thor>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<yard>, [">= 0"])
      s.add_development_dependency(%q<rdoc>, [">= 0"])
      s.add_development_dependency(%q<bundler>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, [">= 0"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
    else
      s.add_dependency(%q<chef>, [">= 11.6.2"])
      s.add_dependency(%q<natives-catalog>, [">= 0.3.1"])
      s.add_dependency(%q<thor>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<yard>, [">= 0"])
      s.add_dependency(%q<rdoc>, [">= 0"])
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<jeweler>, [">= 0"])
      s.add_dependency(%q<simplecov>, [">= 0"])
    end
  else
    s.add_dependency(%q<chef>, [">= 11.6.2"])
    s.add_dependency(%q<natives-catalog>, [">= 0.3.1"])
    s.add_dependency(%q<thor>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<yard>, [">= 0"])
    s.add_dependency(%q<rdoc>, [">= 0"])
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<jeweler>, [">= 0"])
    s.add_dependency(%q<simplecov>, [">= 0"])
  end
end

