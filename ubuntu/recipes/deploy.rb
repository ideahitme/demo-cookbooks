include_recipe "::db"
apt_update 'update'

package 'git' do
  action :install
end

package 'cmake' do
end

# install go app

app = search(:aws_opsworks_app).first
app_path = "/srv/#{app['shortname']}"

git app_path do
  repository app["app_source"]["url"]
  revision app["app_source"]["revision"]
  action :sync
end

gopath = "#{File.expand_path('~')}/goroot/bin"
ENV['PATH'] = "#{ENV['PATH']}:" + gopath

execute 'run cmake' do
  command "cd #{app_path} && make build"
end

execute 'run binary' do
  command "cd #{app_path} && ./build/demo-app &"
end
