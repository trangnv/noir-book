# Data Types

All values in Noir are fundamentally composed of [Field](https://en.wikipedia.org/wiki/Finite_field) elements. For a more approachable developing experience, abstractions are added on top to introduce different data types in Noir.

## Primitive data types

A primitive type represents a single value. Noir has four primary scalar types: `Field`, `bool`, intergers and string. You may recognize some of these from other programming languages. Let's take a look at each one.

### Field

The field type corresponds to the native field type of the proving backend.

The size of a Noir field depends on the elliptic curve's finite field for the proving backend adopted. For the default backend Barretenberg, with the Grumpkin curve, the field size is 254 bits.

You can
