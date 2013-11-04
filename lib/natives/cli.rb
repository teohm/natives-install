require 'thor'
require 'natives/app'

module Natives
  class Cli < Thor
    desc 'install PACKAGE1 PACKAGE2 ..', 'install a list of ruby packages'
    method_option :catalog, default: 'rubygems',
                            desc: 'set the catalog to be used',
                            aliases: '-c'
    def install(*packages)
      Natives::App.new.install options[:catalog], packages
    end
  end
end
