Load LFindLoad.
From lfind Require Import LFind.
Unset Printing Notations.
Set Printing Implicit.

Require Import Arith. 
From QuickChick Require Import QuickChick.
Inductive natural : Type := Succ : natural -> natural |  Zero : natural.
Derive Show for natural. Derive Arbitrary for natural.  Instance Dec_Eq_natural : Dec_Eq natural. Proof. dec_eq. Qed.
Inductive lst : Type :=   Nil : lst | Cons : natural -> lst -> lst .

Inductive tree : Type := Node : natural -> tree -> tree -> tree |  Leaf : tree.

Inductive Pair : Type := mkpair : natural -> natural -> Pair
with Zlst : Type := zcons : Pair -> Zlst -> Zlst |  znil : Zlst.

Fixpoint lfappend (append_arg0 : lst) (append_arg1 : lst) : lst
           := match append_arg0, append_arg1 with
              | Nil, x => x
              | Cons x y, z => Cons x (lfappend y z)
              end.

Fixpoint rev (rev_arg0 : lst) : lst
           := match rev_arg0 with
              | Nil => Nil
              | Cons x y => lfappend (rev y) (Cons x Nil)
              end.

Fixpoint qreva (qreva_arg0 : lst) (qreva_arg1 : lst) : lst
           := match qreva_arg0, qreva_arg1 with
              | Nil, x => x
              | Cons z x, y => qreva x (Cons z y)
              end.

Lemma append_nil : forall (x : lst), lfappend x Nil = x.
Proof.
   intros.
   induction x.
   - reflexivity.
   - simpl. rewrite IHx. reflexivity.
Qed.

Lemma append_assoc : forall (x y z : lst), lfappend (lfappend x y) z = lfappend x (lfappend y z).
Proof.
   intros.
   induction x.
   - reflexivity.
   - simpl. rewrite IHx. reflexivity.
Qed.

Lemma rev_append : forall (x y : lst), rev (lfappend x y) = lfappend (rev y) (rev x).
Proof.
   intros.
   induction x.
   - simpl. rewrite append_nil. reflexivity.
   - simpl. rewrite IHx. rewrite append_assoc. reflexivity.
Qed.

Lemma rev_rev : forall (x : lst), rev (rev x) = x.
Proof.
   intros.
   induction x.
   - reflexivity.
   - simpl. rewrite rev_append. simpl. rewrite IHx. reflexivity.
Qed.

Lemma qreva_rev : forall (x y : lst), qreva x y = lfappend (rev x) y.
Proof.
   induction x.
   - reflexivity.
   - intros. simpl. rewrite IHx. rewrite append_assoc. simpl. reflexivity.
Qed.

Theorem theorem0 : forall (x : lst) (y : lst), eq (qreva (qreva x (rev y)) Nil) (lfappend y x).
Proof.
   induction x.
   - intros. simpl. rewrite qreva_rev. rewrite rev_rev. reflexivity.
   - intros. simpl. 
   rewrite (eq_refl : Cons n (rev y) = lfappend (rev (Cons n Nil)) (rev y)). 
   rewrite <- rev_append. 
   rewrite IHx. 
 lfind_coqsynth.  
Admitted.
              
