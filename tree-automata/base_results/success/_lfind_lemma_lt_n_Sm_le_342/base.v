Load LFindLoad.
From lfind Require Import LFind.
Unset Printing Notations.
Set Printing Implicit.
(* Benchmarks from CoqGym/coq_projects/tree-automata: 
    https://github.com/princeton-vl/CoqGym/blob/master/coq_projects/tree-automata/bases.v  *)

Require Import Arith.
Require Import BinNat.
From IntMap Require Import Allmaps.
	 
Lemma Neqb_complete p q : N.eqb p q = true -> p = q.
Proof. intros. rewrite <- N.eqb_eq. apply H. Qed.


Lemma nat_sum : forall n : nat, n = 0 \/ (exists m : nat, n = S m).
Proof.
	simple induction n. left. reflexivity. intros. right.
	split with n0. reflexivity.
Qed.

(* Helper Lemma = le_n_S, ∀ n m: n ≤ m → S n ≤ S m *)
Lemma le_n_n : forall n : nat, n <= n.
Proof.
        simple induction n. trivial.
        intros. apply Coq.Init.Peano.le_n_S. apply H.
Qed.

(* Helper Lemma = Nat.lt_le_incl, ∀ n m : nat, n < m → n ≤ m  *)
(* Helper Lemma = Nat.le_gt_cases,  ∀ n m : nat, n ≤ m ∨ m < n *)
Lemma le_l_or_r : forall n m : nat, n <= m \/ m <= n.
Proof.
        intros. cut (n <= m \/ m < n). intros. elim H.
        intros. left. assumption.
        intros. right. 
        apply Nat.lt_le_incl. apply H0.
        apply Nat.le_gt_cases.
Qed.

(* Already solved helper lemma in clam *)
Lemma S_plus_l : forall n m : nat, S (n + m) = S n + m.
 Proof.
       simpl in |- *. trivial.
 Qed.
 
 (* Already solved helper lemma in clam *)
 Lemma S_plus_r : forall n m : nat, S (n + m) = n + S m.
 Proof.
       intros. rewrite (Nat.add_comm n (S m)). rewrite (Nat.add_comm n m).
       simpl in |- *. trivial.
 Qed.

(* Helper Lemma = Nat.le_succ_diag_r, ∀ n : nat, n ≤ S n *)
(* Helper Lemma = Nat.le_0_l, ∀ n : nat, 0 ≤ n *)
(* Helper Lemma = max_l, ∀ n m : nat, m ≤ n → Init.Nat.max n m = n *)
(* Helper Lemma = le_n_n, ∀ n : nat, n ≤ n *)
(* Helper Lemma = le_n_S, ∀ n m: n ≤ m → S n ≤ S m *)
Lemma max_le_Sr_0 : forall n m : nat, max n m <= max n (S m) /\ max (S n) m <= max (S n) (S m).
Proof.
	simple induction n; simple induction m. 
    simpl in |- *. split. 
    apply Nat.le_succ_diag_r. 
    apply le_n_n.
	intros. split. elim H. intros. intros. simpl in |- *. 
    apply Nat.le_succ_diag_r. 
	elim H. intros. simpl in |- *. 
    apply Nat.le_succ_diag_r. 
	split. simpl in |- *. 
    cut (max n0 0 = n0). intros. rewrite H0. trivial.
	rewrite max_l. reflexivity. 
    apply Nat.le_0_l.
 	simpl in |- *. 
    apply le_n_n.
	intros. elim H0. intros. split. simpl in |- *. elim (H n1). intros.
    apply le_n_S.
	cut (max (S (S n0)) (S n1) = S (max (S n0) n1)).
	cut (max (S (S n0)) (S (S n1)) = S (max (S n0) (S n1))).
	intros. rewrite H3.
    apply le_n_n.
    elim (H (S n1)).
	intros. elim (H n1). intros. simpl. reflexivity.
    reflexivity.
    apply le_n_S in H1. apply H1. 
Qed.

(* Helper Lemma = max_le_Sr_0 [just the left side of it] *)
Lemma max_le_Sr : forall n m : nat, max n m <= max n (S m).
Proof.
	intros. 
    apply max_le_Sr_0.
Qed.

(* Already solved helper lemma in clam *)
Lemma plus_O_r : forall n : nat, n + 0 = n.
Proof.
	simple induction n. simpl in |- *. trivial.
	intros. simpl in |- *. rewrite H. trivial.
Qed.

(* Already solved helper lemma in clam *)
Lemma plus_O_l : forall n : nat, 0 + n = n.
Proof.
	simple induction n. simpl in |- *. trivial.
	intros. simpl in |- *. trivial.
Qed.

(* Helper Lemma = Nat.le_0_l, ∀ n : nat, 0 ≤ n *)
(* Helper Lemma = le_plus_r, ∀ n m : nat, m ≤ n + m *)
Lemma le_mult_lS : forall n m : nat, n * m <= S n * m.
Proof.
	simple induction n. simpl in |- *. intro. cut (m + 0 = m). intros.
	rewrite H.
    apply Nat.le_0_l.
	apply plus_O_r.
	simpl in |- *. intros.
    apply le_plus_r. 
Qed.

(* Helper Lemma = le_mult_lS, ∀ n m : nat, n * m ≤ S n * m *)
(* Helper Lemma = Nat.mul_comm (already done in clam) *)
Lemma le_mult_rS : forall n m : nat, n * m <= n * S m.
Proof.
	intros. cut (n * m = m * n). cut (n * S m = S m * n).
	intros. rewrite H. rewrite H0. 
    apply le_mult_lS.
    apply Nat.mul_comm.
    apply Nat.mul_comm.
Qed.

(* Helper Lemma = Nat.le_antisymm, ∀ n m : nat, n ≤ m → m ≤ n → n = m *)
(* Helper Lemma = lt_le_S, ∀ n m : nat, n < m → S n ≤ m *)
(* Helper Lemma = Nat.le_gt_cases, ∀ n m : nat, n ≤ m ∨ m < n *)
Lemma le_disj : forall n m : nat, n <= m -> n = m \/ S n <= m.
Proof.
	intros. cut (m <= n \/ n < m). intro. elim H0; intros.
	left. 
    apply Nat.le_antisymm. 
    apply H. apply H1.
	right. 
    apply lt_le_S. 
    apply H1.
    apply Nat.le_gt_cases.
Qed.

(* Helper Lemma = Nat.le_0_r, ∀ n : nat, n ≤ 0 ↔ n = 0 *)
(* Helper Lemma = Nat.le_0_l, ∀ n : nat, 0 ≤ n *)
(* Helper Lemma = Nat.add_le_mono, ∀ n m p q : nat, n ≤ m → p ≤ q → n + p ≤ m + q *)
(* Helper Lemma = le_n_n, ∀ n : nat, n ≤ n *)
(* Helper Lemma = Nat.le_trans, ∀ n m p : nat, n ≤ m → m ≤ p → n ≤ p *)
(* Helper Lemma = le_mult_lS, ∀ n m : nat, n * m ≤ S n * m *)
(* Helper Lemma = le_disj, ∀ n m : nat, n ≤ m → n = m ∨ S n ≤ m *)
(* Helper Lemma = le_S_n, ∀ n m : nat, S n ≤ S m → n ≤ m *)
Lemma le_mult_l : forall n m p : nat, n <= m -> n * p <= m * p.
Proof.
	intro. simple induction m. intros. cut (n = 0). intro. rewrite H0; trivial.
    apply Nat.le_0_r. 
    apply H. induction  n as [| n Hrecn]. intros. simpl in |- *.
    apply Nat.le_0_l. 
	intros. simpl in |- *. cut (n = n0 \/ S n <= n0). intro. cut (n * p <= n0 * p).
	intro. elim H1; intros. cut (p <= p). intros.
    apply Nat.add_le_mono.
    apply H4. apply H2.
    apply le_n_n.
	cut (n * p <= S n * p). cut (S n * p <= n0 * p). intros. 
    apply (Nat.le_trans (p + n * p) (p + S n * p) (p + n0 * p)).
    apply Nat.add_le_mono.
    apply le_n_n.
    apply H5.
    apply Nat.add_le_mono.
    apply le_n_n.
    apply H4. apply H. apply H3.
    apply le_mult_lS.
	elim H1; intros. rewrite H2.
    apply le_n_n. 
	cut (n * p <= S n * p). intro. cut (S n * p <= n0 * p). intro.
    apply (Nat.le_trans (n * p) (S n * p) (n0 * p)).
	apply H3. apply H4. apply H. apply H2.
    apply le_mult_lS.
    apply le_disj.
    apply le_S_n. 
    apply H0.
Qed.

(* Helper Lemma = le_mult_l, ∀ n m p : nat, n ≤ m → n * p ≤ m * p *)
(* Helper Lemma = Nat.mul_comm (already done in clam)  *)
Lemma le_mult_r : forall n m p : nat, n <= m -> p * n <= p * m.
Proof.
	intros. cut (p * n = n * p). intros. cut (p * m = m * p).
	intros. rewrite H0. rewrite H1.
    apply le_mult_l.
    apply H.
    apply Nat.mul_comm. apply Nat.mul_comm.
Qed.

(* Helper Lemma = Nat.le_trans, ∀ n m p : nat, n ≤ m → m ≤ p → n ≤ p *)
(* Helper Lemma = le_mult_l, ∀ n m p : nat, n ≤ m → n * p ≤ m * p *)
(* Helper Lemma = le_mult_r, ∀ n m p : nat, n ≤ m → p * n ≤ p * m*)
Lemma le_mult_mult : forall n m p q : nat, n <= m -> p <= q -> n * p <= m * q.
Proof.
	intros. cut (n * p <= n * q). intro.
	cut (n * q <= m * q). intros.
	apply (Nat.le_trans (n * p) (n * q) (m * q)).
    apply H1. apply H2.
    apply le_mult_l.
    apply H.
    apply le_mult_r.
    apply H0.
Qed.

(* No helper lemmas *)
Lemma Sn_eq_Sm_n_eq_m : forall n m : nat, S n = S m -> n = m.
Proof.
	simple induction n. simple induction m. intros. reflexivity. intros.
	inversion H0. simple induction m. intros. inversion H0. intros.
	inversion H1. reflexivity.
Qed.

(* No helper lemmas *)
Lemma diff_true_false : true <> false.
Proof. discriminate. Qed.

(* No helper lemmas *)
Lemma diff_false_true : false <> true.
Proof. discriminate. Qed.

(* Helper Lemma = diff_true_false, true ≠ false *)
(* Helper Lemma = diff_false_true, false ≠ true *)
Lemma bool_dec_eq : forall a b : bool, {a = b} + {a <> b}.
Proof.
	intros. case a. case b. left. trivial.
	right. 
    apply diff_true_false.
	case b. right. 
    apply diff_false_true.
	left. trivial.
Qed.

(* No helper lemmas *)
Lemma bool_is_false_or_true : forall a : bool, a = false \/ a = true.
Proof.
	simple induction a. right. trivial. left. trivial.
Qed.

(* No helper lemmas *)
Lemma bool_is_true_or_false : forall a : bool, a = true \/ a = false.
Proof.
	simple induction a. left. trivial. right. trivial.
Qed.

(* No helper lemmas *)
Lemma in_M0_false :
 forall (A : Set) (a : A), ~ (exists e : ad, MapGet A (M0 A) e = Some a).
Proof.
	intros. intro. elim H. intros. inversion H0.
Qed.

(* Helper Lemma = M1_semantics_1 ∀ (a : ad) (y : A), MapGet (M1 a y) a = Some y *)
(* Helper Lemma = M1_semantics_2 ∀ (a a' : ad) (y : A), N.eqb a a' = false -> MapGet (M1 a y) a' = None *)
(* Helper Lemma = Neqb_complete ∀ p q : BinPos, N.eqb p q = true -> p = q *)
(* Helper Lemma = Bool.not_true_is_false ∀ b : Bool, b <> true -> b = false *)
Lemma in_M1_id :
 forall (A : Set) (a : A) (x : ad) (e : A),
 (exists c : ad, MapGet A (M1 A x e) c = Some a) -> a = e.
Proof.
	intros. elim H. intros. cut (x = x0). intro. rewrite H1 in H0.
	cut (MapGet A (M1 A x0 e) x0 = Some e). intros. 
	cut (Some e = Some a). intro. inversion H3. trivial.
	transitivity (MapGet A (M1 A x0 e) x0).
	symmetry  in |- *. assumption.
	assumption.
	apply M1_semantics_1.
	cut (Neqb x x0 = false \/ Neqb x x0 = true). intro. elim H1; intros.
	cut (MapGet A (M1 A x e) x0 = None). intro. cut (Some a = None).
	intro. inversion H4. transitivity (MapGet A (M1 A x e) x0). symmetry  in |- *.
	assumption.
	assumption.
	apply M1_semantics_2. apply H2.
	apply Neqb_complete. apply H2.
	elim (bool_dec_eq (Neqb x x0) true). intros. right. assumption.
	intro y. left. 
	apply Bool.not_true_is_false. apply y.
Qed.

(* No helper lemmas *)
Lemma in_M2_disj :
 forall (A : Set) (a : A) (m0 m1 : Map A),
 (exists c : ad, MapGet A (M2 A m0 m1) c = Some a) ->
 (exists c : ad, MapGet A m0 c = Some a) \/
 (exists c : ad, MapGet A m1 c = Some a).
Proof.
	intros. elim H. simple induction x. simpl in |- *. intro. left. split with N0.
	assumption.
	simple induction p. intros. right. simpl in H1. split with (Npos p0).
	assumption.
	intros. left. simpl in H1. split with (Npos p0). assumption.
	intros. right. simpl in H0. split with N0. assumption.
Qed.

Fixpoint Peqb p q {struct q} :=
match p, q with
| xI p, xI q => Peqb p q
| xO p, xO q => Peqb p q
| xH, xH => true
| _,_ => false
end.

(* No helper lemmas *)
Lemma aux_Neqb_1_0 : forall p : positive, Peqb p p = true.
Proof.
	simple induction p. simpl in |- *. intros. trivial. simpl in |- *. intros.
	trivial. trivial.
Qed.

(* No helper lemmas *)
Lemma aux_Neqb_1_1 : forall p p0 : positive, Peqb p p0 = true -> p = p0.
Proof.
	simple induction p. intro. intro. simple induction p1. intros. simpl in H1.
	cut (p0 = p2). intro. rewrite H2. trivial. exact (H p2 H1).
	intros. simpl in H1. inversion H1. intros. inversion H0.
	intro. intro. simple induction p1. intros. inversion H1.
	intros. cut (p0 = p2). intros. rewrite H2. trivial.
	simpl in H1. exact (H p2 H1). intros. inversion H0.
	simple induction p0. intros. inversion H0. intros. inversion H0.
	intros. trivial.
Qed.

(* Helper Lemma = Neqb_complete ∀ p q : BinPos, N.eqb p q = true -> p = q *)
Lemma aux_Neqb_trans :(* Helper Lemma = Neqb_complete ∀ p q : BinPos, N.eqb p q = true -> p = q *)
 forall a b c : ad, Neqb a b = true -> Neqb b c = true -> Neqb a c = true.
Proof.
	intros. rewrite <- (Neqb_complete b c H0). trivial.
Qed.

(* TODO look into what "elim" tactic is doing *)
(* Helper Lemma = lt_n_Sm_le, ∀ n m : nat, n ≤ m → n < S m *)
Lemma indprinciple_nat_gen :
 forall P : nat -> Prop,
 (forall n : nat, (forall m : nat, m < n -> P m) -> P n) ->
 forall n m : nat, m <= n -> P m.
Proof.
	intro. intro. simple induction n. 
	intros. apply (H m). 
	intros. elim (lt_n_O m0 (lt_le_trans m0 m 0 H1 H0)). 
	intros. elim (le_lt_or_eq m (S n0) H1). 
	intros. apply H0. 
	lfind_debug.
	Admitted.

	(* apply lt_n_Sm_le. 
	apply H2.
	intros. rewrite H2. apply H. intros. apply H0.
	apply lt_n_Sm_le. 
	apply H3.
Qed. *)
