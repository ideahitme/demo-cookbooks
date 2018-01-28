apt_update 'update'
package %w(xclip python-pip python-dev build-essential tmux git wget) do
    action :install
end



