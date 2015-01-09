class smokeping::service {

  $ensure = $smokeping::start ? { true => running, false => stopped, default => undef }

  service { 'smokeping':
    ensure    => $ensure,
    enable    => $smokeping::enable,
    hasstatus => false,
    status    => 'pidof "/usr/sbin/smokeping [FPing]"',
  }

}
