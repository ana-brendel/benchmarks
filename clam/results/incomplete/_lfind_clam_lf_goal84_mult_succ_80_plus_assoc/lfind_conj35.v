Load LFindLoad.
Load LFindLoad.
From adtind Require Import goal84.

From lfind Require Import LFind.

From QuickChick Require Import QuickChick.
QCInclude "/home/anabrendel/lfind/benchmarks/clam/sources/_lfind_clam_lf_goal84_mult_succ_80_plus_assoc/".
QCInclude ".".
Extract Constant defNumTests => "50".


Derive Show for natural.

        Derive Arbitrary for natural.

        Instance Dec_Eq_natural : Dec_Eq natural.

        Proof. dec_eq. Qed.



Lemma conj35: forall (lf5 : natural) (lf1 : natural) (y : natural), @eq natural lf1 (plus lf5 (Succ y)).
Admitted.
QuickChick conj35.