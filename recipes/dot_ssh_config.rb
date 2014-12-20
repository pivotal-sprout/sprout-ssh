include_recipe 'sprout-ssh::dot_ssh'

execute 'make sure .ssh/config is owned by the user' do
  command "chown #{node['sprout']['user']} #{node['sprout']['home']}/.ssh/config"
  only_if "test -e #{node['sprout']['home']}/.ssh/config"
end
