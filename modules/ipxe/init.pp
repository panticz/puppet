class ipxe {
  file { "/boot/grub/ipxe.lkrn":
    source => "puppet:///modules/ipxe/ipxe.lkrn"
  }

  file { "/etc/grub.d/49_ipxe":
    source => "puppet:///modules/ipxe/49_ipxe",
    mode => 700
  }

  exec { "update-grub":
    subscribe   => File["/etc/grub.d/49_ipxe"],
    refreshonly => true
  }
}
