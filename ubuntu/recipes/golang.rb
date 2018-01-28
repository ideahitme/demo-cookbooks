# Golang installation 
#

GO_TAR="go1.9.3.linux-amd64.tar.gz"
GO_LINK="https://dl.google.com/go/#{GO_TAR}"
DOWNLOAD_PATH="#{File.expand_path('~')}/#{GO_TAR}"

EXECUTE_PATH="#{File.expand_path('~')}/goroot"

apt_update 'update' 

execute 'download tar' do
  not_if { ::File.directory?("#{EXECUTE_PATH}") }
  command "wget #{GO_LINK} -O #{DOWNLOAD_PATH}"
end 

execute 'unpack' do 
  not_if { ::File.directory?("#{EXECUTE_PATH}") }
  command "mkdir -p #{EXECUTE_PATH} && tar -xzvf #{DOWNLOAD_PATH} -C #{EXECUTE_PATH} --strip-components=1"
end

append_if_no_line 'add executables to zshrc' do
  path "#{File.expand_path('~')}/.zshrc"
  line "export PATH=\"#{EXECUTE_PATH}/bin:$PATH\""
end

directory 'create gopath' do
  path "#{File.expand_path('~')}/go"
end

append_if_no_line 'add GOPATH' do
  path "#{File.expand_path('~')}/.zshrc"
  line "export GOPATH=#{File.expand_path('~')}/go"
end
