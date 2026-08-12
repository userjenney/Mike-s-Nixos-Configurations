{ ... }:

{
  # Linux Kernel
  security.forcePageTableIsolation = false;
  security.lockKernelModules = false;
  security.protectKernelImage = true;
  security.unprivilegedUsernsClone = true;
  security.virtualisation.flushL1DataCache = null;
  boot.kernelParams = [
    #"quiet"
    #"splash"
    "loglevel=3"
    "rd.udev.log_priority=3"
    "systemd.show_status=auto"
    "fbcon=nodefer"
    "vt.global_cursor_default=1"
    "lsm=landlock,lockdown,yama,integrity,apparmor,bpf"
    "usbcore.autosuspend=-1"
    #"video4linux"
    #"acpi_rev_override=5"
  ];
  /*
    boot.kernelPatches = [
      {
        name = "dae-config";
        patch = null;
        structruedExtraConfig = with lib.kernel; {
          # 基礎 BPF 支持
          BPF = yes;
          BPF_SYSCALL = yes;
          BPF_JIT = yes;
          BPF_STREAM_PARSER = yes;
          BPF_EVENTS = yes;

          # 資源控制與探測
          CGROUPS = yes;
          KPROBES = yes;
          KPROBE_EVENTS = yes;

          # 網絡調度與過濾
          NET_INGRESS = yes;
          NET_EGRESS = yes;
          NET_SCH_INGRESS = module; # 對應 CONFIG_NET_SCH_INGRESS=m
          NET_CLS_BPF = module; # 對應 CONFIG_NET_CLS_BPF=m
          NET_CLS_ACT = yes;

          # 調試信息與 BTF (eBPF 必備)
          DEBUG_INFO = yes;
          DEBUG_INFO_REDUCED = no; # 對應 # CONFIG_DEBUG_INFO_REDUCED is not set
          DEBUG_INFO_BTF = yes;
        };
      }
    ];
  */

  # systemd.package = pkgs.systemd.override { withSelinux = true; };

  # environment.systemPackages = with pkgs; [
  #   policycoreutils
  # ];
}
