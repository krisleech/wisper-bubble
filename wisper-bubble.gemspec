
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "wisper/bubble/version"

Gem::Specification.new do |spec|
  spec.name          = "wisper-bubble"
  spec.version       = Wisper::Bubble::VERSION
  spec.authors       = ["Kris Leech"]
  spec.email         = ["kris.leech@gmail.com"]

  spec.summary       = "Wisper Event Bubbling"
  spec.description   = "Wisper Event Bubbling"
  spec.homepage      = ""

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "wisper"
end
