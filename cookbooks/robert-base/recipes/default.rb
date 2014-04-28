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

aws_creds = Chef::EncryptedDataBagItem.load("ec2", "robert")
template "/home/robert/.ec2-creds" do
  source ".ec2-creds.erb"
  owner "robert"
  group "robert"
  mode "600"
  variables({
    :aws_access_key_id => aws_creds["aws_access_key_id"],
    :aws_secret_access_key => aws_creds["aws_secret_access_key"]
  })
end

package "openssh-server" do
  action :upgrade
end
