directory "#{node['sprout']['home']}/.ssh" do
  action :create
  owner node['current_user']
  group 'staff'
  mode '0700'
end
