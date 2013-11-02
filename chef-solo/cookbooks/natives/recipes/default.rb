#
# Cookbook Name:: natives
# Recipe:: default
#
# Copyright (C) 2013 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

require 'natives/catalog'

include_recipe 'homebrew' if use_homebrew?
include_recipe 'apt' if use_apt?

natives_install_list.each do |catalog_name, entries|
  catalog = Natives::Catalog.new(
    catalog_name,
    node[:platform],
    node[:platform_version],
    current_package_provider)

  packages = catalog.native_packages_for(entries.first)
  packages.each do |package_name|
    package package_name do
      action :install
    end
  end
end
