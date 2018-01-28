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

execute 'run cmake' do
  command "cd #{app_path} && make build"
end
