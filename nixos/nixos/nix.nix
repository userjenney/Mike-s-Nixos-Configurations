{ ...}:

{

  #nixos substituters
   nix = {
     settings = {
       substituters = [
         # cache mirror located in China
         # status: https://mirror.sjtu.edu.cn/
         #"https://mirror.sjtu.edu.cn/nix-channels/store"
         # status: https://mirrors.ustc.edu.cn/status/
         #"https://mirrors.ustc.edu.cn/nix-channels/store"
         "https://mirrors.cernet.edu.cn/nix-channels/store"
       ];

       trusted-public-keys = [
         # the default public key of cache.nixos.org, it's built-in, no need to add it here
         "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
       ]; 
       experimental-features = [ "nix-command" "flakes" ];
       auto-optimise-store = true;
    };

    channel = {
      enable = false;
    };
  };

}
