log_level :warn

base_path = File.absolute_path(File.join(File.dirname(__FILE__)))

cookbook_path [
  File.join(base_path, 'cookbooks'),
  File.join(base_path, 'vendored-cookbooks')
]

nodes_path                File.join(base_path, 'nodes')
role_path                 File.join(base_path, 'roles')
data_bag_path             File.join(base_path, 'data_bags')
encrypted_data_bag_secret File.join(base_path, 'data_bag_key')

chef_tmp_path = File.absolute_path(File.join('.', '.natives/chef'))
file_cache_path           File.join(chef_tmp_path, 'cache')
file_backup_path          File.join(chef_tmp_path, 'backup')
