include_recipe "apt"

package "avahi-daemon" do
  action :upgrade
end

apt_repository "plex" do
  uri "http://www.plexapp.com/repo"
  components ["main"]
end

package "plexmediaserver" do
  action :upgrade
end
