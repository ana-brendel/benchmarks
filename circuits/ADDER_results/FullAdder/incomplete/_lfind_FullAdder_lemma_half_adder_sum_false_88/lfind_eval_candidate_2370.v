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






Lemma candidate_2370: forall (a : bool) (lf7 : bool) (lf9 : bool) (lf10 : bool), @eq bool (orb (half_adder_carry a lf9) (half_adder_carry lf7 lf10))   (orb a false).
Admitted.
QuickChick candidate_2370.