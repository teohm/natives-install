require 'spec_helper'
require 'natives/gemfile_viewer'

describe Natives::GemfileViewer do
  describe "#packages" do
    it "list all gems specified in gemfile" do
      gemfile_path = "spec/fixtures/Gemfile.empty"
      gemfile = Natives::GemfileViewer.new(gemfile_path)
      expect(gemfile.packages).to eq(['bundler'])
    end

    it "raises error when failed to list gems in gemfile" do
      gemfile = Natives::GemfileViewer.new("gemfile_not_exist")
      expect { gemfile.packages }.to raise_error
    end
  end
end
