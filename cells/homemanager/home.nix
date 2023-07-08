{ inputs, cell, }:
let
  inherit (inputs) nixpkgs;
  nixTools = cell.packages.nixTools;
in {
  home = { config, user, options, ... }:
    let
      homeDirPrefix =
        if nixpkgs.stdenv.hostPlatform.isDarwin then "/Users" else "/home";
      homeDirectory = "${homeDirPrefix}/${user.username}";
      packages = (nixTools user);
    in {
      home = {
        inherit homeDirectory packages;
        username = user.username;
        stateVersion =
          "23.05"; # See https://nixos.org/manual/nixpkgs/stable for most recent version
        shellAliases = { update = "home-manager switch"; };
      };

      programs = (cell.programs.default homeDirectory user);

      age.identityPaths = options.age.identityPaths.default
        ++ user.ageIdentityPaths or [ ];

      age.secrets.ssh-config = {
        file = ./secrets/ssh-config.age;
        path = "${homeDirectory}/.ssh/config";
      };

      age.secrets.nix-config = {
        file = ./secrets/nix.conf.age;
        path = "${homeDirectory}/.config/nix/nix.conf";
      };

      nixpkgs = {
        config = {
          allowUnfree = true;
          allowUnfreePredicate = (pkg: true);
          allowUnsupportedSystem = true;
        };
      };
    };
}
