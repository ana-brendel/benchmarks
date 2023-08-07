Load LFindLoad.
Load LFindLoad.
From adtind Require Import goal60.

From lfind Require Import LFind.

From QuickChick Require Import QuickChick.
QCInclude "/home/anabrendel/lfind/benchmarks/clam/sources/_lfind_clam_lf_goal60_theorem0_34_lem/".
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



Lemma conj28: forall (y : lst) (z : natural) (lf3 : lst), @eq lst (rev (lfappend y (Cons z Nil))) lf3.
Admitted.
QuickChick conj28.