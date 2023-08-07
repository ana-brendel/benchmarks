Load LFindLoad.
Load LFindLoad.
From adtind Require Import goal30.

From lfind Require Import LFind.

Lemma lfind_state   (x : lst) : @eq lst (rev (lfappend (rev x) Nil)) x.
Admitted.

From QuickChick Require Import QuickChick.
QCInclude "/home/anabrendel/lfind/benchmarks/clam/sources/_lfind_clam_lf_goal30_theorem0_73_append_nil/".
QCInclude ".".
Extract Constant defNumTests => "50".
Derive Show for lst.

        Derive Arbitrary for lst.

        Instance Dec_Eq_lst : Dec_Eq lst.

        Proof. dec_eq. Qed.





Open Scope string_scope.

Parameter print : lst -> string -> lst.
Extract Constant print => "Extract.print".
Definition collect_data (x : lst) :=
 let lfind_var := "x:" ++ "(" ++ show x ++ ")"
 in let lfind_v := print x lfind_var
 in lfind_state  lfind_v.
QuickChick collect_data.
Success.