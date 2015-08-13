# encoding: utf-8

require 'rubocop/formatter/text_util'

module RuboCop
  module Formatter
    # This formatter outputs in Markdown format
    # See: http://spec.commonmark.org/
    class MarkdownFormatter < BaseFormatter
      include PathUtil, TextUtil

      def started(_target_files)
        @report = {}
      end

      def file_finished(file, offenses)
        @report[file] = offenses
      end

      def finished(inspected_files)
        return if inspected_files.empty?
        render_markdown(@report)
      end

      private

      def render_markdown(report)
        report.each do |file, offenses|
          output.puts file_offenses(file, offenses)
          offenses.each do |offense|
            output.puts line_offense(offense)
            output.puts markdown_code(offense)
          end
          output.puts '---'
          output.puts
        end
      end

      def file_offenses(file, offenses)
        offenses_count = pluralize(offenses.count, 'offense', no_for_zero: true)

        "### #{smart_path(file)} - #{offenses_count}"
      end

      def line_offense(offense)
        severity = offense.severity.name.capitalize

        # http://spec.commonmark.org/0.21/#backslash-escapes
        message = offense.message.gsub(/\p{S}/u, '\\\1')

        "#### Line ##{offense.line} - **#{severity}:** _#{message}_"
      end

      def markdown_code(offense)
        source_line = offense.location.source_line
        return if source_line.empty?

        "```\n#{source_line}\n```"
      end

      def smart_path(path)
        path.start_with?(Dir.pwd) ? relative_path(path) : path
      end
    end
  end
end
