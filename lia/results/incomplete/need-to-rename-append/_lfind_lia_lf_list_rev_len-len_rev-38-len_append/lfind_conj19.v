Load LFindLoad.
Load LFindLoad.
From adtind Require Import list_rev_len.

From lfind Require Import LFind.
Require Import Nat.

From QuickChick Require Import QuickChick.
QCInclude "/home/anabrendel/lfind/benchmarks/lia/sources/_lfind_lia_lf_list_rev_len-len_rev-38-len_append/".
QCInclude ".".
Extract Constant defNumTests => "50".
Derive Show for nat.

        Derive Arbitrary for nat.

        Instance Dec_Eq_nat : Dec_Eq nat.

        Proof. dec_eq. Qed.


Derive Show for lst.

        Derive Arbitrary for lst.

        Instance Dec_Eq_lst : Dec_Eq lst.

        Proof. dec_eq. Qed.





Lemma conj19: forall (lf6 : lst) (lf4 : nat) (lf3 : lst), @eq nat (len (append lf6 lf3)) lf4.
Admitted.
QuickChick conj19.