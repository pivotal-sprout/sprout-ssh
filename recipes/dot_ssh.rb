directory "#{node['sprout']['home']}/.ssh" do
  action :create
  owner node['sprout']['user']
  group 'staff'
  mode '0700'
end
