require 'unit/spec_helper'

describe 'sprout-ssh::default' do
  let(:runner) { ChefSpec::Runner.new }

  before do
    stub_command(/test -e/)
    stub_command(/grep 'id_github_current/)
  end

  it 'includes all recipes for now' do
    runner.converge(described_recipe)
    expect(runner).to include_recipe('sprout-ssh::dot_ssh')
    expect(runner).to include_recipe('sprout-ssh::dot_ssh_config')
    expect(runner).to include_recipe('sprout-ssh::dot_ssh_config_github')
    expect(runner).to include_recipe('sprout-ssh::keys')
    expect(runner).to include_recipe('sprout-ssh::known_hosts')
    expect(runner).to include_recipe('sprout-ssh::known_hosts_github')
  end
end
