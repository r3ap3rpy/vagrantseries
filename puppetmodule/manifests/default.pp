exec { "yum update" : 
	command => "/usr/bin/yum update"
}

package { "httpd" : 
	require => Exec["yum update"]
}

service { "httpd":
	ensure => "running",
	enable => "true",
	require => Package["httpd"]
}
file { "/var/www/html" :
	ensure => link,
	target => "/fdrive",
	force => true,
}