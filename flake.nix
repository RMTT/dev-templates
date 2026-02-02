{
  description = "devenv templates";

  outputs =
    { ... }:
    {
      templates = {
        torch = {
          path = ./torch;
          description = "deep learning development";
        };
        postgresql = {
          path = ./postgresql;
          description = "postgresql development";
        };
        rust = {
          path = ./rust;
          description = "rust development";
        };
      };
    };
}
