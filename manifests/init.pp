class orbisnull_mountx (
  $mount_points = $mountx::params::mount_points,
) inherits orbisnull_mountx::params {

  contain  'orbisnull_mountx::install'
}

