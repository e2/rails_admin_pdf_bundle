$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_admin_pdf_bundle/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_admin_pdf_bundle"
  s.version     = RailsAdminPdfBundle::VERSION
  s.authors     = ["Cezary Baginski"]
  s.email       = ["cezary.baginski@gmail.com"]
  s.homepage    = "http://github.com/e2/rails_admin_pdf_bundle"
  s.summary     = "Bulk export to a single PDF"
  s.description = "RailsAdmin custom action to allow exporting selected rows to a pdf."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.1"
  s.add_dependency "prawn"
end
