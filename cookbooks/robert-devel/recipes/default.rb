include_recipe "git"
include_recipe "rbenv"
include_recipe "rbenv::ruby_build"

%w{vim}.each do |pkg|
  package pkg do
    action :upgrade
  end
end

rbenv_ruby "1.9.3-p484" do
  global true
end
