{ pkgs, ... }:

pkgs.mkShell {
  name = "go-demo";
  version = "0.1.2";

  buildInputs = with pkgs; [
    go
    gotools
  ];

}
