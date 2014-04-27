include_recipe "rbenv"
include_recipe "rbenv::ruby_build"

rbenv_ruby "1.9.3-p484" do
  global true
end
