(Basic) Nix Go Demo for Flakes

# To build package
nix build

Then, run: ./result/bin/nix-go-demo

# To run application
nix run

# To load shell
nix develop


# DirEnv
Dir-Env can automatically load shell when openning directory.

> `direnv allow`


# To generate container

nix build .#container

cat ./result | docker load

docker run --rm nix-go-demo-container:wvihq3vm6d0ahf1zaj4dh4sgv6w7pa2q

Note: `nix2container` is necessary to avoid adding image to container image to Nix Store)
