require 'thor'
require 'natives/app'

module Natives
  class Cli < Thor
    desc 'install PACKAGE1 PACKAGE2 ..', 'install a list of ruby packages'
    def install(*packages)
      Natives::App.new.install(packages)
    end
  end
end
