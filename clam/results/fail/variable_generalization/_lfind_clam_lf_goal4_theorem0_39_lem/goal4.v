Load LFindLoad.
From lfind Require Import LFind.
Unset Printing Notations.
Set Printing Implicit.



Inductive natural : Type := Succ : natural -> natural |  Zero : natural.

Inductive lst : Type := Cons : natural -> lst -> lst |  Nil : lst.

Inductive tree : Type := Node : natural -> tree -> tree -> tree |  Leaf : tree.

Inductive Pair : Type := mkpair : natural -> natural -> Pair
with Zlst : Type := zcons : Pair -> Zlst -> Zlst |  znil : Zlst.

Fixpoint double (double_arg0 : natural) : natural
           := match double_arg0 with
              | Zero => Zero
              | Succ n => Succ (Succ (double n))
              end.

Fixpoint lfappend (append_arg0 : lst) (append_arg1 : lst) : lst
           := match append_arg0, append_arg1 with
              | Nil, x => x
              | Cons x y, z => Cons x (lfappend y z)
              end.

Fixpoint len (len_arg0 : lst) : natural
           := match len_arg0 with
              | Nil => Zero
              | Cons x y => Succ (len y)
              end.

Lemma lem : forall l1 l2 n, Succ (len (lfappend l1 l2)) = len (lfappend l1 (Cons n l2)).
Proof.
   induction l1.
   - intros. simpl. f_equal. apply IHl1.
   - intros. reflexivity.
Qed.

Theorem theorem0 : forall (x : lst), eq (len (lfappend x x)) (double (len x)).
Proof.
induction x.
   - simpl.  rewrite <- IHx.  f_equal.  
   lfind_coqsynth.  reflexivity. 
Admitted.
              
