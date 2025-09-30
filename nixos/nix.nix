{ ...}:

{

  #nixos substituters
   nix = {
     settings = {
       trusted-users = [
         "nic"
       ];
       trusted-substituters = [
         # cache mirror located in China
         # status: https://mirror.sjtu.edu.cn/
         #"https://mirror.sjtu.edu.cn/nix-channels/store"
         # status: https://mirrors.ustc.edu.cn/status/
         #"https://mirrors.ustc.edu.cn/nix-channels/store"
         "https://mirrors.cernet.edu.cn/nix-channels/store"
         "https://nix-community.cachix.org"
       ];

       trusted-public-keys = [
         # the default public key of cache.nixos.org, it's built-in, no need to add it here
         "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
         "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
       ]; 
       experimental-features = [ "nix-command" "flakes" ];
       auto-optimise-store = true;
    };

    channel = {
      enable = false;
    };
  };

}
