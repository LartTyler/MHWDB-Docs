Vagrant.configure(2) do |config|
	config.vm.box = "ubuntu/bionic64"

	config.vm.network :forwarded_port, guest: 4567, host: 4567

	config.vm.provider "virtualbox" do |vb|
		vb.memory = "2048"
	end

	config.vm.provision "bootstrap", type: "shell", inline: <<-SHELL
		apt-get update -y

		apt-get install -y ruby ruby-dev
		apt-get install -y pkg-config build-essential nodejs git libxml2-dev libxslt-dev

		apt-get autoremove -yq

		gem install --no-ri --no-rdoc bundler
	SHELL

	config.vm.provision "install", type: "shell", privileged: false, inline: <<-SHELL
		echo "----------------------------------------------"
		echo "Installing dependencies..."

		cd /vagrant

		bundle config build.nokogiri --use-system-libraries
		bundle install

		echo '... Done!'
	SHELL

	config.vm.provision "run", type: "shell", privileged: false, run: "always", inline: <<-SHELL
		echo "----------------------------------------------"
		echo "Starting up middleman at http://localhost:4567"
		echo "If it doesn't come up, check the ~/middleman.log file for any error messages"

		cd /vagrant

		bundle exec middleman server --watcher-force-polling --watcher-latency=1 &> ~/middleman.log &
	SHELL
end