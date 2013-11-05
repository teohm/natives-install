
module Natives
  class GemfileViewer
    def initialize(gemfile_path)
      @gemfile_path = gemfile_path
    end

    def packages
      begin
        # After several trial-and-error, this works:
        # 1. cd to the dir containing the gemfile
        # 2. after that run bundle show
        gemfile_dir = File.expand_path(File.dirname(@gemfile_path))
        gemfile_name = File.basename(@gemfile_path)
        output = %x{cd '#{gemfile_dir}' && BUNDLE_GEMFILE=#{gemfile_name} bundle show 2>&1}
        success = ($?.exitstatus == 0)
        unless success
          raise "Failed to list packages in Gemfile: #{@gemfile_path.inspect}\nReason:\n#{output}"
        end
      end
      extract_packages(output)
    end

    protected

    def extract_packages(output)
      lines = output.split("\n")
      lines.shift # remove first line
      lines.map do |line|
        _, name, _ = line.split(" ")
        name
      end
    end
  end
end
