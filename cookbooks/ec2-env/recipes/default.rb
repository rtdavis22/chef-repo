cookbook_file "ec2-env.sh" do
  mode 0755
  path "/etc/profile.d/ec2-env.sh"
end
