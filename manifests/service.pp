class smokeping::service {

  $ensure = $smokeping::start ? { true => running, false => stopped, default => undef }

  service { 'smokeping':
    ensure    => $ensure,
    enable    => $smokeping::enable,
    hasstatus => false,
    status    => "/etc/init.d/smokeping status; if [ $? -eq 3 ]; then exit 0; else exit 1; fi;",
  }

}
