# Project breakdown

After `nargo new` and `cargo check`, you should have a minimal Nargo project that looks like this:

```
├── Nargo.toml
├── Prover.toml
├── Verifier.toml
└── src
    └── main.nr
```

## Nargo.toml

Contains environmental options of the project

- Defines the compiler version

For example:

```
compiler_version = "0.8.0"
```

- The project we created did not require any dependency, but as project grow, we would need a way to manage dependencies. Nargo.toml is the place to do that.

For example, to add the ecrecover-noir library to your project, add it to `Nargo.toml`:

```toml
# Nargo.toml

[dependencies]
ecrecover = {tag = "v0.2.0", git = "https://github.com/colinnielsen/ecrecover-noir"}
# Specifying a dependency requires a tag to a specific commit and the git url to the url containing the package
```

- It's also possible to specify dependencies that are local

For example, this file structure has a library and binary crate

```
├── binary_crate
│   ├── Nargo.toml
│   └── src
│       └── main.nr
└── liba
    ├── Nargo.toml
    └── src
        └── lib.nr
```

Inside of the binary crate, you can specify:

```
# Nargo.toml

[dependencies]
libA = { path = "../liba" }
```

-

## main.nr

The `main.nr` file contains a main function, this is the entry point into your Noir program.

This is the function main in our sample program

```rust
fn main(hash : pub Field, pre_image : Field) {
    let hash_of_pre_image = std::hash::pedersen([pre_image])[0];
    assert(hash == hash_of_pre_image);
}
```

- The parameters `hash` and `pre_image` can be seen as the API for the program and must be supplied by the prover, in the Prover.toml file.

- Since `hash` is marked as public, the verifier is supplied its value verifying the proof.

- The constrain here is to ensures the satisfaction of the condition (hash_of_pre_image == pedersen(pre_image)[0]), the verifier would reject otherwise.

## Prover.toml

The Prover.toml file is a file which the prover uses to supply the witness values(both private and public).

For example, the Prover.toml file for our sample program would look like this:

```toml
hash = "0x03fdabb754f4f499c12406532fc924264db1b70702888a191683157056334d61"
pre_image = "0"
```

When the command `nargo prove p`` is executed, two processes happen:

- Noir creates a proof that `hash` = "0x03fdabb754f4f499c12406532fc924264db1b70702888a191683157056334d61" and `pre_image` = "0" and `pedersen(pre_image)[0]` = `hash`, without revealing the value of `pre_image`.

- Noir creates and stores the proof of this statement in the proofs directory and names the proof file p, in hex format.

## Verifier.toml

Contains the public values that the verifier uses to verify the proof.

For example, the Verifier.toml file for our sample program would look like this:

```toml
hash = "0x03fdabb754f4f499c12406532fc924264db1b70702888a191683157056334d61"
```

## Verifying a Proof

When the command `nargo verify p`` is executed, two processes happen:

- Noir checks in the proofs directory for a file called p

- If that file is found, the proof's validity is checked, with the corresponding Prover.toml and Verifier.toml files.

> Note: The validity of the proof is linked to the current Noir program; if the program is changed and the verifier verifies the proof, it will fail because the proof is not valid for the modified Noir program.
