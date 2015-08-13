# encoding: utf-8

Gem::Specification.new do |s|
  s.name          = 'rubocop-markdown_formatter'
  s.version       = '0.0.1.pre'
  s.summary       = 'A RuboCop formatter that outputs in Markdown'
  s.author        = 'Martin Manelli'
  s.email         = 'manelli.ml@gmail.com'
  s.homepage      = 'http://github.com/manelli/rubocop-markdown_formatter'
  s.license       = 'MIT'

  s.files = %w(
    lib/rubocop/formatter/markdown_formatter.rb
    spec/rubocop/formatter/markdown_formatter_spec.rb
    Rakefie
    LICENSE
    README.md
    rubocop-markdown_formatter.gemspec
  )

  s.add_dependency 'rubocop', '>= 0.23.0'
  s.add_development_dependency 'rake', '~> 10.1'
  s.add_development_dependency 'rspec', '~> 3.2.0'

  s.required_ruby_version = '>= 1.9.3'
end
