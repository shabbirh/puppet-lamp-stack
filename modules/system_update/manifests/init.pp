class system-update {

		file { "/etc/apt/sources.list.d/dotdeb.list":
				owner  => root,
				group  => root,
				mode   => 664,
				source => "/vagrant/conf/apt/dotdeb.list",
		}

		exec { 'dotdeb-apt-key':
				cwd     => '/tmp',
				command => "wget http://www.dotdeb.org/dotdeb.gpg -O dotdeb.gpg &&
										cat dotdeb.gpg | apt-key add -",
				unless  => 'apt-key list | grep dotdeb',
				require => File['/etc/apt/sources.list.d/dotdeb.list'],
				notify  => Exec['apt_update'],
		}

	  file { "/etc/apt/sources.list.d/mariadb.list":
		  		owner => root,
		  		group => root,
		  		mode => 664,
		  		source => "/vagrant/conf/apt/mariadb.list",
		}
		
		exec ('mariadb-apt-key' :
				cwd => '/tmp',
				command => "apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xcbcb082a1bb943db",
				unless => 'apt-key list | grep maria',
				require => File['/etc/apt/sources.list.d/mariadb.list'],
				notify => Exec['apt_update'],
				


	exec { 'apt-get update':
		command => 'apt-get update',
	}

	$sysPackages = [ "build-essential" ]
	package { $sysPackages:
		ensure => "installed",
		require => Exec['apt-get update'],
	}
}