# THIS MIGHT BE AI SLOP
# Sharing Variables Between Modules in NixOS

This guide explains how to make variables, such as a username string, available to multiple modules in NixOS. The recommended approach is to use the `config` tree for structured and declarative sharing.

---

## 1. Define the Variable in a Module

You can define a custom option in a module by extending the `config` tree using the `options` and `config` attributes.

### Example: `my-module.nix`

```nix
{ config, pkgs, lib, ... }:

{
  options.my.username = {
    type = lib.types.str;  # Specify the type (string in this case)
    default = "default-user";  # Provide a default value (optional)
    description = "The username to be used in other modules.";
  };

  # Set the value (optional, can also be set in other modules)
  config = {
    my.username = "my-custom-username";
  };
}
```

---

## 2. Use the Variable in Other Modules

Other modules can access the defined variable through the `config` object.

### Example: `another-module.nix`

```nix
{ config, pkgs, ... }:

{
  # Access the username defined in my-module.nix
  users.users.${config.my.username} = {
    isNormalUser = true;
    home = "/home/${config.my.username}";
    shell = pkgs.zsh;
  };
}
```

---

## 3. Enable and Integrate Modules

To use these modules, add them to your `configuration.nix`:

```nix
{ config, pkgs, ... }:

{
  imports = [
    ./my-module.nix
    ./another-module.nix
  ];
}
```

---

## 4. Overriding Values

You can override the variable directly in your `configuration.nix` or elsewhere:

```nix
{ config, pkgs, ... }:

{
  my.username = "overridden-username";
}
```

The overridden value will be available to all modules referencing `config.my.username`.

---

## Why Use `config`?

- **Structured and Declarative**: The `config` tree is the canonical way to share settings across modules in NixOS.
- **Type Safety**: By using `options`, you can enforce types and add documentation.
- **Ease of Overrides**: Users can override values in a clean and structured way, without directly modifying modules.

---

## Alternatives

1. **Environment Variables**:
   - Define environment variables using `environment.variables`:
     ```nix
     environment.variables.USERNAME = "my-custom-username";
     ```
   - Less structured and harder to integrate with the Nix module system.

2. **Global Settings File**:
   - Create a `variables.nix` file to store shared variables:
     ```nix
     {
       username = "my-custom-username";
     }
     ```
   - Import it in modules:
     ```nix
     let shared = import ./variables.nix; in
     {
       users.users.${shared.username} = { ... };
     }
     ```
   - Works, but loses type-checking and modularity benefits.

---

## Recommendation

For most cases, defining and sharing variables through the `config` tree using `options` is the **best practice**. It aligns with the modular, declarative philosophy of NixOS and is widely adopted by the community.
