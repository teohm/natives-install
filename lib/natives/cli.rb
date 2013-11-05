require 'thor'
require 'natives/app'
require 'natives/gemfile_viewer'

module Natives
  class Cli < Thor
    desc 'install PACKAGE1 PACKAGE2 ..', 'install a list of ruby packages'
    method_option :catalog, default: 'rubygems',
                            desc: 'set the catalog to be used',
                            aliases: '-c'
    method_option :gemfile, default: 'Gemfile'
    def install(*packages)
      catalog = options[:catalog]

      if catalog == 'rubygems' && packages.empty?
        packages = packages_in_gemfile(options[:gemfile])
      end

      puts "Catalog: #{catalog.inspect}\nPackages:\n#{packages.inspect}\n\n"

      Natives::App.new.install catalog, packages
    end

    protected

    def packages_in_gemfile(gemfile_path)
      Natives::GemfileViewer.new(gemfile_path).packages
    end

  end
end
