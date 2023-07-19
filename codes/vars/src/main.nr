use dep::std;
// fn main() {
//     let x = 3;
//     helper(x);
//     std::println(x);
// }

// fn helper(mut x: i32) {
//     x = 4;
// }

fn main()  {
    let x = 12;
    let y: Field = 4;

    let sum = x + y;
    std::println(sum);

    let product = x * y;
    std::println(product);
    // std::println(p);

    let quotient = x / y;
    std::println(quotient);

    // let power = x ^ y;
    let pow = y.pow_32(4);
    std::println(pow);

}