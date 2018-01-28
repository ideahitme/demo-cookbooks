apt_update 'update' 

package 'zsh' do
end

execute 'download oh-my-zsh' do
  not_if { File.exists?(File.expand_path("~/.oh-my-zsh"))}
  command "wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh" 
end


