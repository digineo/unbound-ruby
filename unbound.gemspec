# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: unbound 2.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "unbound"
  s.version = "2.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Mike Ryan"]
  s.date = "2014-07-23"
  s.description = "Unbound DNS resolver bindings for Ruby"
  s.email = "falter@gmail.com"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    "CHANGELOG.md",
    "CONTRIBUTING.md",
    "Gemfile",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "VERSION",
    "examples/resolve_async.rb",
    "lib/unbound.rb",
    "lib/unbound/bindings.rb",
    "lib/unbound/callback_array.rb",
    "lib/unbound/callbacks_mixin.rb",
    "lib/unbound/context.rb",
    "lib/unbound/exceptions.rb",
    "lib/unbound/query.rb",
    "lib/unbound/query_store.rb",
    "lib/unbound/resolver.rb",
    "lib/unbound/result.rb",
    "spec/callback_array_spec.rb",
    "spec/conf/local_zone.conf",
    "spec/conf/test_config.conf",
    "spec/context_spec.rb",
    "spec/query_spec.rb",
    "spec/query_store_spec.rb",
    "spec/resolver_spec.rb",
    "spec/result_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = "http://github.com/justfalter/unbound-ruby"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.2.0"
  s.summary = "Unbound DNS resolver bindings for Ruby"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<ffi>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, [">= 0"])
    else
      s.add_dependency(%q<ffi>, [">= 0"])
      s.add_dependency(%q<jeweler>, [">= 0"])
    end
  else
    s.add_dependency(%q<ffi>, [">= 0"])
    s.add_dependency(%q<jeweler>, [">= 0"])
  end
end

