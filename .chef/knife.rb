# See http://docs.opscode.com/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "rtdavis22"
client_key               "#{current_dir}/rtdavis22.pem"
validation_client_name   "rtdavis22-validator"
validation_key           "#{current_dir}/rtdavis22-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/rtdavis22"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]
