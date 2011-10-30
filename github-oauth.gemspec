# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "github-oauth"
  s.version     = "0.0.1"
  s.authors     = ["Rune Madsen"]
  s.email       = ["rune@runemadsen.com"]
  s.homepage    = ""
  s.summary     = %q{A simple gem to handle the Github OAuth authentication}
  s.description = %q{A simple gem to handle the Github OAuth authentication}

  s.rubyforge_project = "github-oauth"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  s.add_dependency "oauth2"
end
