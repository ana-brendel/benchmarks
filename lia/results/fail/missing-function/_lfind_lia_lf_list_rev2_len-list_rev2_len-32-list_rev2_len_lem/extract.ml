
  module SS = Set.Make(String)
  let values = ref SS.empty
    
  let write_to_file value=
    let oc = open_out_gen [Open_append; Open_creat] 0o777 "/home/anabrendel/lfind/benchmarks/lia/sources/_lfind_lia_lf_list_rev2_len-list_rev2_len-32-list_rev2_len_lem/examples_list_rev2_len.txt" in
    if not(SS.mem value !values) then 
      (
        values := SS.add value !values;
        Printf.fprintf oc "%s\n"  value;
      );
    close_out oc; ()
  
  let print n nstr=
    write_to_file (String.of_seq (List.to_seq nstr));
    (n)
    