require 'tempfile'
require 'json'
require 'chef/application/solo'

module Natives
  class App
    def install(packages)
      create_tmp_attrs_file(Array(packages)) do |attrs_file|
        run_chef_solo(attrs_file)
      end
    end

    def run_chef_solo(json_attrs_file)
      ARGV.clear
      [
        '-c', File.join(gem_base_path, 'chef-solo', 'config.rb'),
        '-o', 'natives',
        '-j', json_attrs_file.to_path
      ].each do |token|
        ARGV << token
      end
      Chef::Application::Solo.new.run
    end

    def create_tmp_attrs_file(packages, &block)
      file = Tempfile.new('natives.temp_attrs_file')
      file.write(json_attrs(packages))
      file.flush
      file.rewind
      begin
        block.call(file)
      ensure
        file.close!
      end
    end

    protected

    def current_working_dir
      Dir.pwd
    end

    def gem_base_path
      File.absolute_path(File.join(File.dirname(__FILE__), '..', '..'))
    end

    def json_attrs(packages)
      {
        "natives" => {
          "install_list" => {
            "rubygems" => packages
          },
          "config" => {
            "working_dir" => current_working_dir
          }
        }
      }.to_json
    end
  end
end
