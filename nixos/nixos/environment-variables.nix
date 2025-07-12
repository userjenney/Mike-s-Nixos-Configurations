{ ... }:

{
  # system envieonment var
  environment.variables = {
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
    EDITOR = "vim";
    DEVBOX_USE_VERSION = "0.15.0";
  };
}
