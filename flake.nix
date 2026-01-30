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
      };
    };
}
