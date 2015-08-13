# RuboCop Markdown Formatter (WIP)

A formatter for [RuboCop](https://github.com/bbatsov/rubocop) that spits [Markdown](http://commonmark.org/).
It requires RuboCop version 0.23.0 or above.

## Installation

Add this line to your application's Gemfile:

    gem 'rubocop-markdown_formatter'

And then execute:

    bundle

Or install it yourself as:

    gem install rubocop-markdown_formatter

## Usage

    rubocop --require rubocop/formatter/markdown_formatter --format RuboCop::Formatter::MarkdownFormatter
