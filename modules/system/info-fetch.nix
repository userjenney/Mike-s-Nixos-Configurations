{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    onefetch
    ipfetch
    cpufetch
    ramfetch
    starfetch
    octofetch
    htop
    bottom
    btop
    zfxtop
    kmon

    # vulkan-tools
    # opencl-info
    # clinfo
    # vdpauinfo
    # libva-utils
    nvtopPackages.nvidia
    nvtopPackages.intel
    wlr-randr
    gpu-viewer
    dig
    speedtest-rs
  ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableBashIntegration = true;
    loadInNixShell = true;
    direnvrcExtra = ''
      export FOO="foo"
      echo "loaded direnv!"
    '';
  };

}
