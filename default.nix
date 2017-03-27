{pkgs ? import <nixpkgs> {} }:
let
  callPackage = pkgs.lib.callPackageWith (pkgs // pkgs.xlibs // self);
  #ocamlCallPackage = pkgs.ocamlPackages.callPackageWith (pkgs // pkgs.xlibs // self);
  self = {
    simgrid_batsim = callPackage ./simgrid/batsim.nix { };
    batsim = callPackage ./batsim { };
    redox = callPackage ./redox { };
    rapidjson = callPackage ./rapidjson { };
    interval_set = callPackage ./interval-set { };
    evalys = callPackage ./evalys { interval_set = callPackage ./interval-set { }; };
    obandit = pkgs.ocamlPackages.callPackage ./obandit { };
    zymake = pkgs.ocamlPackages.callPackage ./zymake { };
    ocs = pkgs.ocamlPackages.callPackage ./ocs {
      obandit =  pkgs.ocamlPackages.callPackage ./obandit { };
    };
  };
in
  self
