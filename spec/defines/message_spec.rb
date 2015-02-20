require 'spec_helper'

describe 'motd::message', :type => :define do
  let :title do
    'somename'
  end
  let :facts do
    {
      :osfamily         => 'RedHat',
      :concat_basedir   => '/dne',
      :id               => 'root',
      :is_pe            => true,
      :kernel           => '3.13.0-45-generic',
      :path             => '/usr/bin:/bin'
    }
  end

  it { should include_class('motd') }

  context 'population via source file' do
    let :params do
      {
        :source  => '/somefile',
        :content => '',
      }
    end
    it { should contain_concat__fragment('somename').with_source('/somefile') }
  end

  context 'population via content param' do
    let :params do
      {
        :source  => '',
        :content => 'somecontent',
      }
    end
    it { should contain_concat__fragment('somename').with_content('somecontent') }
  end
end
