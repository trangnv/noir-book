use dep::std;
fn main(hash : pub Field, pre_image : Field) {
    let hash_of_pre_image = std::hash::pedersen([pre_image])[0];
    assert(hash == hash_of_pre_image);
}
#[test]
fn test_main() {
    main(0x03fdabb754f4f499c12406532fc924264db1b70702888a191683157056334d61, 0);
    // let hash = std::hash::pedersen([0])[0];
    // std::println(hash);
}
