user "robert" do
  home "/home/robert"
  shell "/bin/bash"
end

directory "/home/robert/.ssh" do
  owner "robert"
  group "robert"
end

rob_key = Chef::EncryptedDataBagItem.load("ssh_keys", "rob")
file "/home/robert/.ssh/id_rsa" do
  owner "robert"
  group "robert"
  mode "600"
  content rob_key["private_key"]
end

public_key = data_bag_item("ssh_keys", "rob")["public_key"]
file "/home/robert/.ssh/authorized_keys" do
  owner "robert"
  group "robert"
  mode "644"
  content public_key
end

package "openssh-server" do
  action :upgrade
end
