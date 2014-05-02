include_recipe "git"
include_recipe "gradle"
include_recipe "java"
include_recipe "nodejs"
include_recipe "rbenv"
include_recipe "rbenv::ruby_build"
include_recipe "scala"

%w{vim}.each do |pkg|
  package pkg do
    action :upgrade
  end
end

rbenv_ruby "1.9.3-p484" do
  global true
end

cookbook_file "/home/robert/.gitconfig" do
  source ".gitconfig"
  owner "robert"
  group "robert"
end
