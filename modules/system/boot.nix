{ lib, ... }:

{

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = false;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 10;
  boot.zfs.extraPools = [ "tank" ];
  boot.zfs.forceImportRoot = false;
  boot.kernelParams = [ "nouveau.modeset=1" ];
  boot.blacklistedKernelModules = [
    "nvidia"
    "nvidia_uvm"
    "nvidia_drm"
    "nvidia_modeset"
  ];

  # grub
  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    zfsSupport = true;
    devices = [
      "nodev"
    ];
    configurationLimit = 10;
    useOSProber = true;
  };

  boot.supportedFilesystems = {
    zfs = lib.mkForce true;
  };

  boot.tmp.useTmpfs = true;
  boot.tmp.tmpfsSize = "50%";
  boot.tmp.tmpfsHugeMemoryPages = "never";

  # do garbage collection weekly to keep disk usage low
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 1w";
  };

}
