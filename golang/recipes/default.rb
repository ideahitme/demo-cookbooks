Chef::Log.info("****Installing Go****")
apt_repository 'golang' do
    uri 'ppa:gophers/archive'
end
apt_update 'update'

apt_package 'golang-1.9-go' do

end
