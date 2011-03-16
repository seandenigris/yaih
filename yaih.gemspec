# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "yaih/version"

Gem::Specification.new do |s|
  s.name        = "yaih"
  s.version     = Yaih::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["lucapette"]
  s.email       = ["lucapette@gmail.com"]
  s.homepage    = "https://github.com/lucapette/yaih"
  s.summary     = %q{Yet Another IRB History}
  s.description = %q{a bash like history}

  s.rubyforge_project = "yaih"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
