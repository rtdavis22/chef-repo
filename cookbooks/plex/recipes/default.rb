include_recipe "apt"

package "avahi-daemon" do
  action :upgrade
end

apt_repository "plex" do
  uri "http://plex.r.worldssl.net/PlexMediaServer/ubuntu-repo"
  distribution "lucid"
  components ["main"]
  trusted true
end

package "plexmediaserver" do
  action :upgrade
end
