Load LFindLoad.
Load LFindLoad.
From adtind Require Import goal82.

From lfind Require Import LFind.
Require Import Arith. 

From QuickChick Require Import QuickChick.
QCInclude "/home/anabrendel/lfind/benchmarks/clam/sources/_lfind_clam_lf_goal82_theorem0_76_append_assoc/".
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



Lemma conj63_imp: forall (lf6 : lst) (x : lst) (y : lst) (n : natural), forall
  _ : forall y0 : lst, @eq lst (qreva (qreva x (rev y0)) lf6) (lfappend y0 x),
@eq lst (lfappend (lfappend y (Cons n lf6)) x) (lfappend y (Cons n x)).
Admitted.
QuickChick conj63_imp.