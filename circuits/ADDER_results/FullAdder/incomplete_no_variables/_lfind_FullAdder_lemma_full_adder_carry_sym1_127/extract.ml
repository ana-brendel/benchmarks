
  module SS = Set.Make(String)
  let values = ref SS.empty
    
  let write_to_file value=
    let oc = open_out_gen [Open_append; Open_creat] 0o777 "/home/anabrendel/lfind/benchmarks/circuits/ADDER_tests/FullAdder/_lfind_FullAdder_lemma_full_adder_carry_sym1_127/examples_FullAdder.txt" in
    if not(SS.mem value !values) then 
      (
        values := SS.add value !values;
        Printf.fprintf oc "%s\n"  value;
      );
    close_out oc; ()
  
  let print n nstr=
    write_to_file (String.of_seq (List.to_seq nstr));
    (n)
    