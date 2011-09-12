#
# Cookbook Name:: yoke
# Recipe:: default
#
# Copyright 2011, Joshua Timberman <cookbooks@housepub.org>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

yoke_picker = {
  'php' => 'Execute as PHP code',
  'python' => 'Execute as Python code',
  'ruby' => 'ExecuteRubyInlineV3',
  'bash' => 'Execute as shell script',
  'node' => 'Execute as NodeJS code',
  'all' => '*'
}

yoke_dir = "#{Chef::Config[:file_cache_path]}/yoke"
services_dir = "#{::File.expand_path(node['current_user'])}/Library/Services"

git yoke_dir do
  repository "git://github.com/cziko/yoke.git"
  action :checkout
end

directory services_dir do
  recursive true
end

ruby_block "Install Yoke for #{node['yoke']['install']}" do
  block do
    src = case yoke_picker[node['yoke']['install']]
          when "*"
            Dir.glob("#{yoke_dir}/Services/#{yoke_picker[node['yoke']['install']]}.workflow")
          else
            "#{yoke_dir}/Services/#{yoke_picker[node['yoke']['install']]}.workflow"
          end

    FileUtils.cp_r(src, services_dir)

    case node['yoke']['install']
    when "ruby"
      Chef::Log.info("Yoke installed for ruby. Keyboard shortcut is Command + > or Command + Shift + .")
    else
      Chef::Log.info("Yoke installed for #{node['yoke']['install']}, setup keyboard shortcut in")
      Chef::Log.info("System Preferences... -> Keyboard -> Keyboard Shortcuts -> Services -> Text")
    end
  end
end
