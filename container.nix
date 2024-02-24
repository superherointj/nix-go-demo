{ nix-go-demo
, lib
, pkgs
}:

pkgs.dockerTools.buildImage {
  name = "nix-go-demo-container";
  config = {
    Cmd = [ "nix-go-demo" ]; # "start"
    Env = [
      # A user is required by nix
      # https://github.com/NixOS/nix/blob/9348f9291e5d9e4ba3c4347ea1b235640f54fd79/src/libutil/util.cc#L478
      "USER=nobody"
      "LC_ALL=en_US.UTF-8"
      "LANG=en_US.UTF-8"
    ]
    # ++ (lib.optional (with pkgs.stdenv.hostPlatform; isLinux && isGnu) "LOCALE_ARCHIVE=${pkgs.glibcLocalesUtf8}/lib/locale/locale-archive")
    ;
    ExposedPorts = {
      # "80/tcp" = {};
      "8080/tcp" = {};
    };
  };
  copyToRoot = pkgs.buildEnv {
    name = "image-root";
    paths = with pkgs; [
      # bash
      # coreutils
      # gnugrep
      # gnused
      nix-go-demo
    ];
    pathsToLink = [ "/bin" ];
  };
}