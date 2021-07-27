#==============================================================================================================================
#==============================  Error running 'requirements_debian_libs_install libssl-dev' ==================================
#		description: O erro acontece porque as gems utilizadas no projeto requerem essass librarias.
#==============================================================================================================================
#sudo nano /etc/apt/sources.list
#add deb http://security.ubuntu.com/ubuntu bionic-security main
#sudo apt update && apt-cache policy libssl1.0-dev
#sudo apt-get install libssl1.0-dev
#==============================================================================================================================
#                                           ===						Libs							===
#==============================================================================================================================
#mysql client is missing. You may need to 'sudo apt-get install libmariadb-dev', 
#'sudo apt-get install libmysqlclient-dev' or 'sudo yum install mysql-devel', and try again.
