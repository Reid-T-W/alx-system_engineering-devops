# (puppet manifest that configures a brand new server and sets custom response header)
exec {'command_install':
  command => 'apt-get -y update;apt-get -y install nginx;ufw allow \'Nginx HTTP\''
  path    => '/usr/bin'
}
exec {'command_header':
  notify  => Service['nginx'],
  path    => '/bin',
  command => "sed -i \"42i\\	add_header X-Served-By ${hostname};\" /etc/nginx/sites-available/default",
}
service {'nginx':
  ensure => 'running',
  enable => true,
}
