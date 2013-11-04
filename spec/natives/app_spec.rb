require 'spec_helper'
require 'natives/app'

describe Natives::App do
  describe "#install" do
    let(:app) { Natives::App.new }

    it "forces packages argument to be an Array" do
      app.should_receive(:run_chef_solo)
      app.should_receive(:create_tmp_attrs_file).with("foo", []).and_call_original

      app.install("foo", nil)
    end

    it "forces catalog_name to be a String" do
      app.should_receive(:run_chef_solo)
      app.should_receive(:create_tmp_attrs_file).with("", []).and_call_original

      app.install(nil, nil)

    end
  end

  describe "#create_tmp_attrs_file" do
    let(:app) { Natives::App.new }

    it "generates a valid solo.json file" do
      json = nil
      app.create_tmp_attrs_file('rubygems', ['foo', 'bar']) do |file|
        json = JSON.parse(file.read)
      end
      expect(json).to eq({
        "natives" => {
          "install_list" => {
            "rubygems" => ["foo", "bar"]
          },
          "config" => {
            "working_dir" => Dir.pwd
          }
        }
      })
    end

    it "generates solo.json file based on the given catalog name" do
      json = nil
      app.create_tmp_attrs_file('npm', ['foo', 'bar']) do |file|
        json = JSON.parse(file.read)
      end
      expect(json).to eq({
        "natives" => {
          "install_list" => {
            "npm" => ["foo", "bar"]
          },
          "config" => {
            "working_dir" => Dir.pwd
          }
        }
      })
    end

    it "handles empty package list" do
      json = nil
      app.create_tmp_attrs_file('rubygems', []) do |file|
        json = JSON.parse(file.read)
      end
      expect(json).to eq({
        "natives" => {
          "install_list" => {
            "rubygems" => []
          },
          "config" => {
            "working_dir" => Dir.pwd
          }

        }
      })
    end
  end

  describe "#run_chef_solo" do
    let(:app) { Natives::App.new }

    it "rewrites ARGV with Chef Solo options and run Chef Solo Application" do
      attrs_file = double()
      attrs_file.stub(:to_path) { '/path/to/attrs_file' }

      Chef::Application::Solo.any_instance.should_receive(:run)

      app.run_chef_solo(attrs_file)

      expect(ARGV).to eq([
        '-c',
        File.absolute_path(File.join(
          File.dirname(__FILE__), '..', '..', 'chef-solo', 'config.rb')),
        '-o', 'natives',
        '-j', '/path/to/attrs_file'
      ])
    end
  end
end
