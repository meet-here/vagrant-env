# update the box
exec { "update":
    command => "apt-get update",
    provider => shell,
}

# install necessary libraries
package { "build-essential":
    ensure => present,
    require => Exec["update"],
}

package { "libssl-dev":
    ensure => present,
    require => Exec["update"],
}

package { "libffi-dev":
    ensure => present,
    require => Exec["update"],
}

# install python dev packages
package { "python-dev":
    ensure => present,
    require => Exec["update"],
}

package { "python3-dev": 
    ensure => present,
    require => Exec["update"],
}

package { "ipython3":
    ensure => present,
    require => Exec["update"],
}

package { "python3-ipdb":
    ensure => present,
    require => Exec["update"],
}

package { "python-pip":
    ensure => present,
    require => Exec["update"],
}

package { "python3-pip":
    ensure => present,
    require => Exec["update"],
}

exec { "install_crossbar":
    command => "pip install crossbar",
    provider => shell,
    require => Package["python-pip", "build-essential", "libssl-dev",  "libffi-dev"],
}

exec { "pip3_install_autobahn":
    command => "pip3 install autobahn[asyncio]",
    provider => shell,
    require => Package["python-pip", "build-essential", "libssl-dev",  "libffi-dev"],
}

# install Ruby for using the SASS compiler
package { "ruby":
    ensure => present,
    require => Exec["update"],
}

exec { "install_sass":
    command => "gem install sass",
    provider => "shell",
    require => Package["ruby"],
}

#install node, npm & bower
package { "npm":
	ensure => present,
	require => Exec["update"],
}

package { "nodejs-legacy":
	ensure => present,
	require => Exec["update"],
}

package { "git":
	ensure => present,
	require => Exec["update"],
}

exec { "install_bower":
	command => "npm -g install bower",
	provider => "shell",
	require => Package["npm"],
}

