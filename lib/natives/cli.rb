require 'thor'
require 'natives/app'
require 'natives/gemfile_viewer'

module Natives
  class Cli < Thor
    default_task :install

    desc 'install [ENTRY1 ENTRY2 ..]',
         'install native packages required by the catalog entries'

    method_option :catalog, default: 'rubygems',
      aliases: '-c',
      desc: 'use this catalog'
    method_option :gemfile, default: 'Gemfile',
      desc: 'use gems in the gemfile as the catalog entries'
    method_option :"update-provider", type: 'boolean',
      default: false,
      aliases: '-u',
      desc: "update package provider's repo (eg. apt-get update)"

    method_option :"test-run", type: 'boolean',
      default: false,
      aliases: %w(-t --dry-run),
      desc: "run without actually installing native packages"

    def install(*packages)
      catalog = options[:catalog]
      configs = {
        update_provider: options['update-provider'],
        test_run: options['test-run']
      }
      if catalog == 'rubygems' && packages.empty?
        packages = packages_in_gemfile(options[:gemfile])
      end

      puts "catalog: #{catalog.inspect}"
      puts "entries: #{packages.inspect}"
      puts "configs: #{configs}"
      puts ""

      Natives::App.new.install(catalog, packages, configs)

    rescue => ex
      $stderr.puts ex.message
    end

    protected

    def packages_in_gemfile(gemfile_path)
      Natives::GemfileViewer.new(gemfile_path).packages
    end

  end
end
