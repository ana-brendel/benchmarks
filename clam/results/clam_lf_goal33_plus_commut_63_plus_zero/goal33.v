Load LFindLoad.
From lfind Require Import LFind.
Unset Printing Notations.
Set Printing Implicit.



Inductive natural : Type :=   Zero : natural | Succ : natural -> natural .

Inductive lst : Type :=  Nil : lst | Cons : natural -> lst -> lst .

Inductive tree : Type := Node : natural -> tree -> tree -> tree |  Leaf : tree.

Inductive Pair : Type := mkpair : natural -> natural -> Pair
with Zlst : Type := zcons : Pair -> Zlst -> Zlst |  znil : Zlst.

Fixpoint plus (plus_arg0 : natural) (plus_arg1 : natural) : natural
           := match plus_arg0, plus_arg1 with
              | Zero, n => n
              | Succ n, m => Succ (plus n m)
              end.

Fixpoint mult (mult_arg0 : natural) (mult_arg1 : natural) : natural
           := match mult_arg0, mult_arg1 with
              | Zero, n => Zero
              | Succ n, m => plus (mult n m) m
              end.

Fixpoint fac (fac_arg0 : natural) : natural
           := match fac_arg0 with
              | Zero => Succ Zero
              | Succ n => mult (fac n) n
              end.

Fixpoint qfac (qfac_arg0 : natural) (qfac_arg1 : natural) : natural
           := match qfac_arg0, qfac_arg1 with
              | Zero, n => n
              | Succ n, m => qfac n (mult m n)
              end.
Lemma plus_succ : forall (x y : natural), plus x (Succ y) = Succ (plus x y).
Proof.
   intros.
   induction x.
   - reflexivity.
   - simpl. rewrite IHx. reflexivity.
Qed.

Lemma plus_assoc : forall (x y z : natural), plus (plus x y) z = plus x (plus y z).
Proof.
   intros.
   induction x.
   - reflexivity.
   - simpl. rewrite IHx. reflexivity.
Qed.

Lemma plus_zero : forall (x : natural), plus x Zero = x.
Proof.
   intros.
   induction x.
   - reflexivity.
   - simpl. rewrite IHx. reflexivity.
Qed.

Lemma plus_commut : forall (x y : natural), plus x y = plus y x.
Proof.
   intros.
   induction x.
   - 
 lfind_coqsynth.  reflexivity. 
Admitted.
