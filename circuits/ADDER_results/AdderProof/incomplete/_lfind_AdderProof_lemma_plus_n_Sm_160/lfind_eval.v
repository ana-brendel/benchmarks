Load LFindLoad.
From lfind Require Import LFind.
From CircuitsCoqGym Require Import Adder. 
From Circuits Require Import AdderProof.

Set Printing Depth 1000.
Unset Printing Notations.
Set Printing Implicit.

Definition lfind_eval (lf5 : nat) :=
Nat.add lf5 lf5.

Compute lfind_eval (S (S (S (S (S (S (S (S (S (S O)))))))))).
