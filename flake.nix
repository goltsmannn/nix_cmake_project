{
    description = "Software Onboarding Lab 2 Part 3 Flake Library";
    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs";
    };

    outputs = { self, nixpkgs, ...} @inputs:
    let
        system = "aarch64-darwin";
        overlay = final: prev: {
            hellolib = final.callPackage ./default.nix {};
        };
        overlays = [overlay];
        pkgs = import nixpkgs {
            system = "aarch64-darwin";
            overlays = [ self.overlays.default ];
        };
    in
    {
        packages.${system}.default = pkgs.hellolib;
        overlays.default = nixpkgs.lib.composeManyExtensions overlays;
    };
}