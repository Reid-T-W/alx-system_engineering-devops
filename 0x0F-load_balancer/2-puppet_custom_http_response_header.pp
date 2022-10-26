# (puppet manifest that configures a brand new server and sets custom response header)
package {'nginx':
  ensure => 'installed',
}
exec {'command_header':
  path    => '/bin',
  command => "sed -i \"42i\\	add_header X-Served-By ${hostname};\" /etc/nginx/sites-available/default",
}
service {'nginx':
  ensure => 'running',
  enable => true,
}
