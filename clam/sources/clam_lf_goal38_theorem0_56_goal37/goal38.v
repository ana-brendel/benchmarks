Load LFindLoad.
From lfind Require Import LFind.
Unset Printing Notations.
Set Printing Implicit.

Require Import Arith.

Inductive natural : Type := Succ : natural -> natural |  Zero : natural.

Inductive lst : Type := Cons : natural -> lst -> lst |  Nil : lst.

Inductive tree : Type := Node : natural -> tree -> tree -> tree |  Leaf : tree.

Inductive Pair : Type := mkpair : natural -> natural -> Pair
with Zlst : Type := zcons : Pair -> Zlst -> Zlst |  znil : Zlst.

Fixpoint lfappend (append_arg0 : lst) (append_arg1 : lst) : lst
           := match append_arg0, append_arg1 with
              | Nil, x => x
              | Cons x y, z => Cons x (lfappend y z)
              end.

Fixpoint Neqb (n m: natural) : bool :=
  match n, m with
    | Zero, Zero => true
    | Zero, Succ _ => false
    | Succ _, Zero => false
    | Succ n', Succ m' => Neqb n' m'
  end.
Fixpoint lfmem  (mem_arg1 : lst) (mem_arg0 : natural)
:= match mem_arg0, mem_arg1 with
  | x, Nil => false
  | x, Cons y z => orb (Neqb x y) (lfmem z x)
  end.

Theorem goal36 : forall (x : natural) (y : lst) (z : lst), lfmem y x = true -> lfmem (lfappend y z) x = true.
Proof.
   intros.
   induction y.
   - simpl. destruct H.
Admitted.
      (* + auto.
      + apply IHy in H. auto.
   - contradiction.
Qed. *)

Theorem goal37 : forall (x : natural) (y : lst) (z : lst), lfmem z x = true -> lfmem (lfappend y z) x = true.
Proof.
   intros.
   induction y.
   - simpl. rewrite IHy. apply Bool.orb_true_r.
   - auto.
Qed.

Theorem theorem0 : forall (x : natural) (y : lst) (z : lst), lfmem y x = true \/ lfmem z x = true -> lfmem (lfappend y z) x = true.
Proof.
   intros.
   destruct H.
   - 
   apply goal36. assumption.
   - 
 lfind_coqsynth.  apply H. 
Admitted.
