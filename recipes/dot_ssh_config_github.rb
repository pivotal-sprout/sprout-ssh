include_recipe 'sprout-ssh::dot_ssh_config'

execute 'add Github configuration to .ssh/config' do
  config = "\n\nHost github.com\n  User git\n  IdentityFile #{node['sprout']['home']}/.ssh/id_github_current"
  command "echo '#{config}' >> #{node['sprout']['home']}/.ssh/config"
  not_if "grep 'id_github_current' #{node['sprout']['home']}/.ssh/config"
  user node['sprout']['user']
end
