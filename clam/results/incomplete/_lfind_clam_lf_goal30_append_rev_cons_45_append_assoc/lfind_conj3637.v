Load LFindLoad.
Load LFindLoad.
From adtind Require Import goal30.

From lfind Require Import LFind.

From QuickChick Require Import QuickChick.
QCInclude "/home/anabrendel/lfind/benchmarks/clam/sources/_lfind_clam_lf_goal30_append_rev_cons_45_append_assoc/".
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



Lemma conj3637: forall (lf8 : lst) (l1 : lst) (x : natural) (lf4 : lst) (lf12 : lst) (n : natural) (l2 : lst), @eq lst
  (lfappend (lfappend (lfappend (rev l2) lf8) (Cons x (rev l1)))
     (Cons n lf12)) (lfappend (lfappend (rev l2) lf8) lf4).
Admitted.
QuickChick conj3637.