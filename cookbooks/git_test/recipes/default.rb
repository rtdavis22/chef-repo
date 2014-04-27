#
# Cookbook Name:: git_test
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

git "/usr/local/git_test" do
  repository "https://github.com/rtdavis22/json-cpp.git"
  revision "master"
  action :sync
  notifies :run, "execute[python-setup]", :immediately
end

execute "python-setup" do
  command "/usr/bin/g++ examples.cpp"
  cwd "/usr/local/git_test"
  action :nothing
end
