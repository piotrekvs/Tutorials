#!/bin/bash

# Maven installer for Debian based systems
# Maven home page: https://maven.apache.org/index.html
# Variables
mvn_version="3.8.7"
url="https://dlcdn.apache.org/maven/maven-3/${mvn_version}/binaries/apache-maven-${mvn_version}-bin.tar.gz"
install_dir="/opt/maven"
env_vars="/etc/profile.d/maven.sh"

if [[ "$1" = "install" && "$(id -u)" = 0 ]]; then

	if [ -d ${install_dir} ]; then 
		echo "Maven is already installed!"; exit;
	fi
	# Install
	echo "Installing maven:"
	echo "Download..."
	mkdir ${install_dir}
	curl -fsSL ${url} | tar xz --strip-components=1 -C ${install_dir}

	echo "Set environmental varibles..."
	cat <<- EOF > ${env_vars}
	#!/bin/sh
	export MAVEN_HOME=${install_dir}
	export M2_HOME=${install_dir}
	export M2=${install_dir}/bin
	EOF
	source ${env_vars}

	echo "Update alternatives..."
	update-alternatives --install "/usr/local/bin/mvn" "mvn" "${install_dir}/bin/mvn" 0
	update-alternatives --set mvn "${install_dir}/bin/mvn"
	update-alternatives --list mvn

	printf "\n\nMaven ${mvn_version} has been successfully installed to ${install_dir}!\n\n\n"
	mvn --version



elif [[ "$1" = "remove" && "$(id -u)" = 0 ]]; then
	# Security checks, so you don't destroy your os ;)
	if [[ ! -d ${install_dir} || "${install_dir##*/}" != "maven" ]]; then 
		echo "No Maven installations found!"; exit;
	fi

	#Remove
	echo "Removing maven:"
	echo "Remove files..."
	rm -rf ${install_dir}
	echo "Remove environmental varibles..."
	rm ${env_vars}
	echo "Update alternatives..."
	update-alternatives --remove mvn "${install_dir}/bin/mvn"
	update-alternatives --list mvn
	printf "\n\nMaven ${mvn_version} has been successfully removed!\n"



else
	echo "Run this script with sudo and with parameters: \"install\" or \"remove\"."
fi
exit
