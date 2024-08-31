{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  };


  outputs = { self, nixpkgs }:
  {
    templates = {
      python = {
        path = self.templates.python.default.path;
        description = self.templates.python.default.description;
        default = {
          path = ./python/default;
          description = "Python template";
        };
        poetry = {
          path = ./python/poetry;
          description = "Python template with poetry";
        };
      };
      poetry = builtins.warn "poetry has been renamed to python.poetry" self.templates.python.poetry;
      rust = {
        path = self.templates.rust.default.path;
        description = self.templates.rust.default.description;
        default = {
          path = ./rust/default;
          description = "Rust template";
        };
        fenix = {
          path = ./rust/fenix;
          description = "Rust template with fenix";
        };
        rust-overlay = {
          path = ./rust/rust-overlay;
          description = "Rust template with rust-overlay";
        };
      };
      zig = {
        path = ./zig;
        description = "Zig template";
      };
    };
  };
}