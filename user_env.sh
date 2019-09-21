#! /bin/bash
###################################################
# Author: NewLight
# Version: 0.1
# Purpose: This script will check if the following enviroments are installed :
# ipython, fish, irb, groovysh.
# This script will also check if GIT is installed.
# If GIT is not installed, it will be installed and ask the user to config and set up a remote server.
# If they are not the user will be able to allow the script to install them.
###################################################

## Variables ##
deco_time=2
deco_line='####################################################'
###############


## Check/Install Ipython/Python 3.x ##
function check_ipython(){
        echo "Checking Python3 Version... "
        python3 -V | grep  " 3." &> /dev/null
        if [[ $? != 0 ]] ; then echo "Updating Python and installing ipython... "
                yum install -y python-pip python3-pip &> /dev/null
                pip3 install ipython &> /dev/null
                if [[ $? != 0 ]] ; then  echo "Error Occoured."
                else
                        echo "ipython installed successfully!"
                fi

        else
                echo "Installing ipython..."
                pip3 install ipython &> /dev/null
                if [[ $? != 0 ]] ; then echo "Error Occoured."
                else
                        echo "ipython installed successfully!"
                fi
        fi

}


## Check/Install fish - bash shell env ##
function check_fish() {
	echo "Checking if fish is installed..."
	fish -v &> /dev/null
	if [[ $? -eq 0 ]] ; then echo "Fish is installed!"
else
	echo "installing fish..."
	yum-config-manager --add-repo https://download.opensuse.org/repositories/shells:fish:release:2/CentOS_7/shells:fish:release:2.repo &> /dev/null
	yum install -y fish &> /dev/null
	if [[ $? != 0 ]] ; then echo "Fish installed successfully!"
	fi


fi
}

## Check/Install irb - interactive ruby shell ##
function check_irb(){
        echo "Checking if irb is installed..."
        irb -v &> /dev/null
        if [[ $? -eq 0 ]] ; then echo "irb is installed!"
else
	echo "Installin irb... "
	yum install -y ruby ruby-devel ruby-irb ruby-rdoc ruby-ri &> /dev/null
        echo "irb installed successfully!"
        


fi
}

## Check/Install groovysh - interactive ruby shell ##
function check_groovysh(){
        echo "Checking if groovysh is installed..."
        groovysh -version &> /dev/null
        if [[ $? -eq 0 ]] ; then echo "groovysh is installed!"
	groovy -version
else
	echo "Installing Groovysh..."
        yum install -y groovy &> /dev/null
	groovysh -version
        if [[ $? != 0 ]] ; then echo "groovysh installed successfully!"
        fi


fi
}


## Check/Install+config GIT - Version Control ##
function check_git(){
        echo "Checking if GIT is installed..."
        git --version &> /dev/null
        if [[ $? -eq 0 ]] ; then echo "GIT is installed!"
        git --version
        read -p "Please enter GIT user name: " git_user
        read -p "Please enter GIT email address: " git_email
        git config user.name "$git_user"
        git config user.email "$git_email"
        echo "Git is configured!"
else
        echo "Installing GIT..."
        yum install -y git &> /dev/null
        git --version &> /dev/null
        if [[ $? != 0 ]] ; then echo "GIT installed successfully!"
	read -p "Please enter GIT user name: " git_user
	read -p "Please enter GIT email address: " git_email
	git config user.name "$git_user"
	git config user.email "$git_email"
	git remote add origin https://github.com/OrNaishtat/IAC.git
	git push --set-upstream origin master
	echo "Git is configured!"
        fi


fi
}



echo $deco_line
check_ipython
echo $deco_line
check_fish
echo $deco_line
check_irb
echo $deco_line
check_groovysh
echo $deco_line
check_git
echo $deco_line

