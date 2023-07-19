# Variables and Mutability

Variables in Noir are immutable by default. This means that once a value is bound to a variable, it cannot be changed. This is a good thing, as it prevents a whole class of bugs that can occur in other languages. However, there are times when you want to be able to change a value. For this, Noir provides the `mut` keyword.

```rust
let x = 2;
x = 3; // error: x must be mutable to be assigned to

let mut y = 3;
let y = 4; // OK
```

Note that mutability in noir is local and everything is passed by value, so if a called function mutates its parameters then the parent function will keep the old value of the parameters.

```rust
use dep::std;
fn main() {
    let x = 3;
    helper(x);
    std::println(x); // x is still 3
}

fn helper(mut x: i32) {
    x = 4;
}
```

Put the above code in `main.nr` and run `nargo check` to generate the Prover.toml and Verifier.toml files. Then run `nargo prove p --show-output` to print the logging of the program execution. (We will have a detailed look at more options of Nargo CLI in later chapter). You should see the following output, it's in hex format:

```bash
0x03
```

## Comptime values

## Global variables
