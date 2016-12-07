class orbisnull_mountx::install inherits orbisnull_mountx {
  
  $mount_points_hiera = hiera_array('orbisnull_mountx::mount_points', [])  

  if $mount_points != undef {
    $mount_points_full=concat($mount_points_hiera, $mount_points)
  } 
  else {
    $mount_points_full = $mount_points_hiera
  }
  $mount_points_install = unique($mount_points_full)

  $mount_points_install.each |$mount| {
    notify{"mount point: ${mount}":}
    $mount_name = $mount[dest]
    mounts { $mount_name:
      source => $mount[source],
      dest   => $mount[dest],
      type   => $mount[typefs],
      opts   => $mount[opts],
    }
  }

}
