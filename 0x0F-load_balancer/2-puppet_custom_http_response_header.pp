# (puppet manifest that configures a brand new server and sets custom response header)
package {'nginx':
  ensure => 'installed',
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
exec {'command_301':
  path    => '/bin',
  command => 'sed -i "49i\	location \/redirect_me {\n		try_files \$uri =301;\n	}" /etc/nginx/sites-available/default',
}
exec {'command_header':
  path    => '/bin',
  command => "sed -i \"42i\	add_header X-Served-By ${hostname};\" /etc/nginx/sites-available/default",
}
service {'nginx':
  ensure => 'running',
  enable => true,
}
