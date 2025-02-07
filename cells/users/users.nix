{
  inputs,
  cell,
}: let
  canton = import ../homemanager/packages/canton.nix {inherit inputs cell;};
  daml = import ../homemanager/packages/daml.nix {inherit inputs cell;};
in {
  leopang = {
    email = "pangleo1994@gmail.com";
    gitSigningKey = "07F0D06865380163";
    name = "Leo Pang";
    username = "leopang";
    github_username = "allthatjazzleo";
    packages = pkgs:
      with pkgs; [
        # canton
        # daml
        argocd
        discord
        iterm2
        jetbrains.goland
        utm
        zoom-us
      ]; # user specific packages
    ageIdentityPaths = ["~/.ssh/id_ed25519_homemanager"];
    # zsh = false; # programs
    java = true;
    session_recording = false;
  };
  workuser = {
    email = "xx@xxx.com";
    name = "Leo Pang";
    username = "workuser";
    github_username = "xxx";
  };
}
