# (Puppet manifest to configure a brand new webserver)
package {'nginx':
  ensure => 'installed',
}
service {'nginx':
  ensure => 'running',
  enable => true,
}
file {'/var/www/html/index.nginx-debian.html':
  ensure  => 'present',
  path    => '/var/www/html/index.nginx-debian.html',
  content => 'Hello World!',
}
file {'/usr/share/nginx/html/custom_404':
  ensure  => 'present',
  path    => '/usr/share/nginx/html/custom_404',
  content => 'Ceci n\'est pas une page',
}
exec {'command301':
  path    => '/usr/bin',
  command => 'sed -i "53i\	location \/redirect_me {\n		try_files \$uri =301;\n	}" /etc/nginx/sites-available/default',
}
