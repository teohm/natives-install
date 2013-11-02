module NativesRecipeHelper
  def use_homebrew?
    ::File.exist? '/usr/local/bin/brew'
  end

  def use_apt?
    !which('apt-get').nil?
  end

  def natives_install_list
    node["natives"]["install_list"]
  end

  def current_package_provider
    package_provider = Chef::Platform.find_provider_for_node({
      platform: node[:platform], platform_version: node[:platform_version]},
      ::Chef::Resource::Package.new(""))
    package_provider.to_s.split('::').last.downcase
  end

  def which(cmd)
    paths = (ENV['PATH'].split(::File::PATH_SEPARATOR) + %w(/bin /usr/bin /sbin /usr/sbin))

    paths.each do |path|
      possible = File.join(path, cmd)
      return possible if File.executable?(possible)
    end

    nil
  end
end

class Chef
  class Recipe
    include NativesRecipeHelper
  end
end
