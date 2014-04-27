#
# Cookbook Name:: robs_stuff
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

user "robert" do
  home "/home/robert"
  shell "/bin/bash"
end

rob_key = Chef::EncryptedDataBagItem.load("ssh_keys", "rob")
file "/home/robert/id_rsa" do
  content rob_key["private_key"]
end
