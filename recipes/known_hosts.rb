include_recipe 'sprout-ssh::dot_ssh'

file "#{node['sprout']['home']}/.ssh/known_hosts" do
  action :create_if_missing
  owner node['sprout']['user']
  group 'staff'
  mode '0644'
end
