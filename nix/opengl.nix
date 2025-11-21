{ pkgs, config, ... }:

{

  # Last version that supports Kepler GPUs
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.legacy_470;

  services.xserver.videoDrivers = [ "nvidia" ];

  # Enable OpenGL
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
}
