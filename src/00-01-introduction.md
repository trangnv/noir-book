# Introduction

## What is Noir?

Noir is a fully open-source language for private, succinctly provable programs.. It's design choices are influenced heavily by Rust.

Noir is flexible in its design, as it does not compile immediately to a fixed NP-complete language. Instead, Noir compiles to an intermediate language (ACIR), which itself can be compiled to an arithmetic circuit (if choosing to target Aztec's barretenberg backend) or a rank-1 constraint system (if choosing to target an R1CS backend like Arkwork's Marlin backend, or others)

## What can you do with Noir?

- First of course Noir can be used to write program which can be compiled to an intermediate language (ACIR), which itself can be compiled to an arithmetic circuit (if choosing to target Aztec's barretenberg backend), or a rank-1 constraint system (if choosing to target an R1CS backend like Arkwork's Marlin backend, or others)

- Noir currently includes a command to publish a Solidity contract which verifies your Noir program.
