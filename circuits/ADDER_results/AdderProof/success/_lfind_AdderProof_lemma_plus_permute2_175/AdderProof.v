Load LFindLoad.
From lfind Require Import LFind.
Unset Printing Notations.
Set Printing Implicit.

From CircuitsCoqGym Require Import Adder. 

(****************************************************************)

Lemma BV_full_adder_nil_true_ok :
forall v : BV, BV_to_nat (BV_full_adder v nilbv true) = S (BV_to_nat v).
Proof.
   unfold nilbv in |- *. simple induction v; auto with arith. unfold BV_full_adder in |- *. intros.
   rewrite BV_full_adder_sum_eq3. rewrite BV_full_adder_carry_eq3.
   rewrite (app_eq2 bool). rewrite half_adder_carry_true.
   simpl in |- *. elim a. unfold appbv in H. rewrite H. simpl in |- *. auto with arith.
   rewrite BV_full_adder_sum_v_nil_false.
   rewrite BV_full_adder_carry_v_nil_false. rewrite BV_to_nat_app2.
   simpl in |- *. elim mult_n_O. elim plus_n_O. trivial with arith.
Qed.


Lemma BV_full_adder_nil_ok :
forall (v : BV) (cin : bool), BV_to_nat (BV_full_adder v nilbv cin) = BV_to_nat v + bool_to_nat cin. 
Proof.
   simple induction v. simple induction cin; auto with arith.
   simple induction cin. rewrite BV_full_adder_nil_true_ok. simpl in |- *. auto with arith.
   unfold BV_full_adder in |- *. rewrite BV_full_adder_sum_v_nil_false.
   rewrite BV_full_adder_carry_v_nil_false. rewrite BV_to_nat_app2.
   simpl in |- *. elim mult_n_O. elim plus_n_O. trivial with arith.
Qed.

(****************************************************************)

Theorem BV_full_adder_ok :
forall (v w : BV) (cin : bool), BV_to_nat (BV_full_adder v w cin) = BV_to_nat v + BV_to_nat w + bool_to_nat cin.
Proof.
   simple induction v.
   intros.
   rewrite BV_full_adder_sym.
   simpl in |- *.
   rewrite BV_full_adder_nil_ok.
   auto with arith.

   unfold BV_full_adder in |- *.
   simple induction w.
   simpl in |- *.
   intro.
   rewrite H.
   simpl in |- *.
   elim plus_n_O.
   elim plus_n_O.
   replace
   (BV_to_nat l + bool_to_nat (half_adder_carry a cin) +
   (BV_to_nat l + bool_to_nat (half_adder_carry a cin))) with
   (bool_to_nat (half_adder_carry a cin) + bool_to_nat (half_adder_carry a cin) +
   (BV_to_nat l + BV_to_nat l)).
   repeat rewrite plus_assoc.
   replace
   (bool_to_nat (half_adder_sum a cin) + bool_to_nat (half_adder_carry a cin) +
   bool_to_nat (half_adder_carry a cin)) with
   (bool_to_nat (half_adder_sum a cin) +
   (bool_to_nat (half_adder_carry a cin) +
   bool_to_nat (half_adder_carry a cin))).
   rewrite half_adder_ok.
   rewrite (plus_permute2 (bool_to_nat a) (bool_to_nat cin) (BV_to_nat l)).
   rewrite
   (plus_permute2 (bool_to_nat a + BV_to_nat l) (bool_to_nat cin) (BV_to_nat l))
   .
   trivial with arith.

   trivial with arith.

   repeat rewrite plus_assoc.
   rewrite
   (plus_permute2 (bool_to_nat (half_adder_carry a cin))
      (bool_to_nat (half_adder_carry a cin)) (BV_to_nat l))
   .
   rewrite (plus_comm (bool_to_nat (half_adder_carry a cin)) (BV_to_nat l)).
   rewrite
   (plus_permute2 (BV_to_nat l + bool_to_nat (half_adder_carry a cin))
      (bool_to_nat (half_adder_carry a cin)) (BV_to_nat l))
   .
   trivial with arith.

   intros.
   simpl in |- *.
   rewrite H.
   clear H.
   elim cin; elim a.
   rewrite full_adder_carry_sym1.
   rewrite full_adder_carry_true.
   rewrite full_adder_sum_sym1.
   rewrite full_adder_sum_true.
   simpl in |- *.
   repeat rewrite plus_n_SO.
   elim plus_n_Sm.
   elim plus_n_Sm.
   simpl in |- *.
   elim plus_n_Sm.
   repeat rewrite plus_assoc.
   rewrite
   (plus_permute2 (bool_to_nat a0 + BV_to_nat l) (BV_to_nat l0) (BV_to_nat l))
   .
   rewrite (plus_comm (bool_to_nat a0) (BV_to_nat l)).
   rewrite (plus_permute2 (BV_to_nat l) (bool_to_nat a0) (BV_to_nat l)).
   trivial with arith.

   elim a0.
   simpl in |- *.
   elim plus_n_Sm.
   simpl in |- *.
   elim plus_n_O.
   elim plus_n_Sm.
   elim plus_n_Sm.
   elim plus_n_Sm.
   elim plus_n_O.
   repeat rewrite plus_assoc.
   rewrite (plus_permute2 (BV_to_nat l) (BV_to_nat l0) (BV_to_nat l)).
   trivial with arith.

   simpl in |- *.
   repeat rewrite <- plus_n_Sm.
   repeat rewrite <- plus_n_O.
   repeat rewrite plus_assoc.
   try trivial with arith.
   rewrite (plus_permute2 (BV_to_nat l) (BV_to_nat l0) (BV_to_nat l)).
   try trivial with arith.

   elim a0.
   simpl in |- *.
   repeat rewrite <- plus_n_Sm.
   repeat rewrite <- plus_n_O.
   repeat rewrite plus_assoc.
   simpl in |- *.
   rewrite (plus_permute2 (BV_to_nat l) (BV_to_nat l0) (BV_to_nat l)).
   trivial with arith.

   simpl in |- *.
   repeat rewrite <- plus_n_O.
   repeat rewrite plus_assoc.
   rewrite (plus_permute2 (BV_to_nat l) (BV_to_nat l0) (BV_to_nat l)).
   trivial with arith.

   elim a0; simpl in |- *; repeat rewrite <- plus_n_Sm;
   repeat rewrite <- plus_n_O; repeat rewrite plus_assoc.
   lfind_debug.
   Admitted.

   (* rewrite (plus_permute2 (BV_to_nat l) (BV_to_nat l0) (BV_to_nat l));
   trivial with arith.

Qed. *)
(****************************************************************)