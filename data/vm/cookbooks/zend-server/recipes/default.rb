execute "install zend key" do
#this command will be executed if "zend" is not found in apt-key list
  command "wget http://repos.zend.com/zend.key -O- | apt-key add -"
  not_if "apt-key list| /bin/grep -c zend"
end

execute "install zend repository " do
#just like we did with the key, we will only install the repository if its not found
  command "echo 'deb http://repos.zend.com/zend-server/deb server non-free' >> /etc/apt/sources.list"
  not_if "grep 'http://repos.zend.com/zend-server/deb' -c /etc/apt/sources.list"
end

execute "update apt" do
  # we are telling apt to update but be quiet and confirm any prompts
  command "apt-get update -q -y"
end

package "mysql-server"
package "zend-server-ce-php-5.3"

execute "rm -rf /var/www"
link "/var/www" do
  to "/vagrant/public"
end