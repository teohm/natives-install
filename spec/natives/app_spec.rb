require 'spec_helper'
require 'natives/app'

describe Natives::App do
  describe "#install" do
    let(:app) { Natives::App.new }

    it "forces packages argument to be an Array" do
      app.should_receive(:run_chef_solo)
      app.should_receive(:create_solo_json_tempfile).
        with("foo", [], app.default_configs).
        and_call_original

      app.install("foo", nil)
    end

    it "forces catalog_name to be a String" do
      app.should_receive(:run_chef_solo)
      app.should_receive(:create_solo_json_tempfile).
        with("", ['foo', 'bar'], app.default_configs).
        and_call_original

      app.install(nil, ['foo', 'bar'])
    end

    it "merges configs with default configs" do
      app.should_receive(:run_chef_solo)
      app.should_receive(:create_solo_json_tempfile).
        with("foobar", ['foo', 'bar'], app.default_configs.merge({foo: false})).
        and_call_original

      app.install('foobar', ['foo', 'bar'], {foo: false})
    end

    it "treats nil configs as empty hash" do
      app.should_receive(:run_chef_solo)
      app.should_receive(:create_solo_json_tempfile).
        with("foobar", ['foo', 'bar'], app.default_configs).
        and_call_original

      app.install('foobar', ['foo', 'bar'], nil)
    end
  end

  describe "#create_solo_json_tempfile" do
    let(:app) { Natives::App.new }

    it "generates a valid solo.json file" do
      json = nil
      app.create_solo_json_tempfile(
        'rubygems',
        ['foo', 'bar'],
        {working_dir: '/path/to/working_dir'}) do |file|
        json = JSON.parse(file.read)
      end
      expect(json).to eq({
        "natives" => {
          "install_list" => {
            "rubygems" => ["foo", "bar"]
          },
          "configs" => {
            "working_dir" => '/path/to/working_dir'
          }
        }
      })
    end

    it "generates solo.json file based on the given catalog name" do
      json = nil
      app.create_solo_json_tempfile(
        'npm', ['foo', 'bar'],
        {working_dir: '/path/to/foo'}) do |file|
        json = JSON.parse(file.read)
      end
      expect(json).to eq({
        "natives" => {
          "install_list" => {
            "npm" => ["foo", "bar"]
          },
          "configs" => {
            "working_dir" => '/path/to/foo'
          }
        }
      })
    end

    it "handles empty package list" do
      json = nil
      app.create_solo_json_tempfile('rubygems', [], {}) do |file|
        json = JSON.parse(file.read)
      end
      expect(json).to eq({
        "natives" => {
          "install_list" => {
            "rubygems" => []
          },
          "configs" => {
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
          File.dirname(__FILE__), '..', '..', 'chef', 'solo.rb')),
        '-o', 'natives',
        '-j', '/path/to/attrs_file'
      ])
    end
  end
end
