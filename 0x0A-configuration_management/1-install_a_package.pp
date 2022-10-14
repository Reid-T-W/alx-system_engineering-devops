# (Puppet file to install flask package from pip3)
package {'flask':
  ensure   => installed,
  provider => 'pip3',
}
