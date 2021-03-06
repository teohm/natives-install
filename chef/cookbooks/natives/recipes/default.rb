#
# Cookbook Name:: natives
# Recipe:: default
#
# Copyright (C) 2013 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

require 'natives/catalog'

if node['natives']['configs']['update_provider']
  include_recipe('homebrew') if use_homebrew?
  include_recipe('apt') if use_apt?
end

natives_install_list.each do |catalog_name, entries|
  catalog = Natives::Catalog.new(
    catalog_name,
    node[:platform], node[:platform_version],
    current_package_provider,
    working_dir: node['natives']['configs']['working_dir']
  )
  packages = catalog.native_packages_for(entries)

  packages.each do |package_name|
    package package_name do
      action :install
    end
  end
end
