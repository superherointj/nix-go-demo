{ buildGoModule, lib, ... }:

buildGoModule rec {
  pname = "nix-go-demo";
  version = "0.0.1";

  src = ./src/.;

  subPackages = [ "." ];

  vendorHash = null;

  meta = with lib; {
    description = "";
    homepage = "https://github.com/superherointj/nix-go-demo";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };
}
