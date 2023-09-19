Load LFindLoad.
Load LFindLoad.
From Circuits Require Import FullAdder.

From lfind Require Import LFind.
From CircuitsCoqGym Require Import HalfAdder. 

Lemma lfind_state   (a : bool) : @eq bool
  (orb (half_adder_carry a true)
     (half_adder_carry (half_adder_sum a true) false))
  (orb (half_adder_carry a false)
     (half_adder_carry (half_adder_sum a false) true)).
Admitted.

From QuickChick Require Import QuickChick.
QCInclude "/home/anabrendel/lfind/benchmarks/circuits/ADDER_tests/FullAdder/_lfind_FullAdder_lemma_half_adder_sum_false_88/".
QCInclude ".".
Extract Constant defNumTests => "50".
Derive Show for bool.

        Derive Arbitrary for bool.

        Instance Dec_Eq_bool : Dec_Eq bool.

        Proof. dec_eq. Qed.






Lemma candidate_2014: forall (lf3 : bool) (a : bool) (lf6 : bool), @eq bool (orb lf6 (half_adder_carry (half_adder_sum a true) (false)))   (orb (half_adder_carry a (false)) lf3).
Admitted.
QuickChick candidate_2014.