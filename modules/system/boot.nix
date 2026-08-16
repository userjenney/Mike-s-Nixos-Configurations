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
    enable = false;
    efiSupport = true;
    zfsSupport = true;
    devices = [
      "nodev"
    ];
    configurationLimit = 10;
    useOSProber = false;
  };

  boot.loader.limine = {
    enable = true;
    efiSupport = true;
    biosDevice = "nodev";
    maxGenerations = 5;
    enableEditor = true;
  };

  boot.supportedFilesystems = {
    zfs = lib.mkForce true;
  };

  boot.tmp.useTmpfs = true;
  boot.tmp.tmpfsSize = "50%";
  boot.tmp.tmpfsHugeMemoryPages = "never";

}
