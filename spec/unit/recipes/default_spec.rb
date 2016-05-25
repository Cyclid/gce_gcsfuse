#
# Cookbook Name:: gce_gcsfuse
# Spec:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'gce_gcsfuse::default' do
  context 'When all attributes are default, on Ubuntu Trusty' do
    before do
      stub_command('mount | grep /gcsfuse >/dev/null').and_return(true)
    end

    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new do |node, _server|
        node.default['lsb']['codename'] = 'trusty'
      end
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end
