Load LFindLoad.
Load LFindLoad.
From adtind Require Import goal30.

From lfind Require Import LFind.

From QuickChick Require Import QuickChick.
QCInclude "/home/anabrendel/lfind/benchmarks/clam/sources/_lfind_clam_lf_goal30_rev_append_54_append_rev_cons/".
QCInclude ".".
Extract Constant defNumTests => "50".
Derive Show for lst.

        Derive Arbitrary for lst.

        Instance Dec_Eq_lst : Dec_Eq lst.

        Proof. dec_eq. Qed.




Derive Show for natural.

        Derive Arbitrary for natural.

        Instance Dec_Eq_natural : Dec_Eq natural.

        Proof. dec_eq. Qed.



Lemma conj3706: forall (lf10 : lst) (lf8 : lst) (l1 : lst) (lf12 : lst) (n : natural) (n0 : natural), @eq lst (lfappend (rev (lfappend l1 lf8)) (Cons n lf12))
  (lfappend (lfappend lf10 (Cons n0 lf12)) (lfappend (rev l1) (Cons n lf12))).
Admitted.
QuickChick conj3706.