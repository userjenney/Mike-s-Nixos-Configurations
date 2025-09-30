{ pkgs, ... }:

{
  
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = false;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 10;

  # grub
  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    devices = [
      "nodev"
    ];
    configurationLimit = 10;
    useOSProber = true;
  };    

  boot.supportedFilesystems = {
  };



    # do garbage collection weekly to keep disk usage low
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 1w";
  };

}
