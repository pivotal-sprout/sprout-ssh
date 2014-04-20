unless node.key?('github_project')
    # If there is no github_project defined, we will use the name of the machine as the SSH key,
    # therefore make sure we have a name first.

  include_recipe 'sprout-osx-settings::machine_name'
end

execute 'create SSH key pair for Github' do
  command "ssh-keygen -N '' -f #{node['sprout']['home']}/.ssh/id_github_#{node["github_project"] || node['fqdn']}"
  user node['current_user']
  not_if "test -e #{node['sprout']['home']}/.ssh/id_github_#{node["github_project"] || node['fqdn']}"
end

execute 'symlink Github key for git-project' do
  command "ln -nfs #{node['sprout']['home']}/.ssh/id_github_{#{node["github_project"] || node['fqdn']},current}"
  user node['current_user']
  only_if { node.key?('github_project') }
end

execute 'symlink Github public key for git-project' do
  command "ln -nfs #{node['sprout']['home']}/.ssh/id_github_{#{node["github_project"] || node['fqdn']},current}.pub"
  user node['current_user']
  only_if { node.key?('github_project') }
end
