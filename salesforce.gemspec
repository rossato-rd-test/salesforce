Gem::Specification.new do |s|
  s.name               = "salesforce"
  s.version            = "0.0.1"
  s.default_executable = "salesforce"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Thiago Rossato"]
  s.date = %q{2015-08-26}
  s.description = %q{A Salesforce connector built uppon 'databasedotcom' to sync contacts data.}
  s.email = %q{rosasto.rd.test01@gmail.com}
  s.files = ["Rakefile", "lib/salesforce.rb"]
  s.test_files = ["test/test_salesforce.rb"]
  s.homepage = %q{http://rubygems.org/gems/salesforce}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{2.4.8}
  s.summary = %q{Salesforce Contact sync!}
  s.license = 'MIT'
end

