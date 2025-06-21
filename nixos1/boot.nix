{ pkgs, ... }:

{
  
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 10;

  # grub
  boot.loader.grub = {
    enable = false;
    efiSupport = true;
    devices = [
      "nodev"
    ];
    configurationLimit = 10;
    useOSProber = true;
    extraEntries = ''
      menuentry "nixos" {
        set root=(hd1,gpt2)
        chainloader /boot/EFI/NixOS-boot/grubx64.efi
      }
    '';
  };    


    # do garbage collection weekly to keep disk usage low
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 1w";
  };

}
