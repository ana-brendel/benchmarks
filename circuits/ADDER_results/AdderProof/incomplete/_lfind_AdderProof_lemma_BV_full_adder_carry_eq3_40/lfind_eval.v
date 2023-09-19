Load LFindLoad.
From lfind Require Import LFind.
From CircuitsCoqGym Require Import Adder. 
From Circuits Require Import AdderProof.

Set Printing Depth 1000.
Unset Printing Notations.
Set Printing Implicit.

Definition lfind_eval (lf14 : bool) (l : list bool) :=
BV_full_adder_sum l (@nil bool) lf14.

Compute lfind_eval (true) ((@cons (bool) false (@cons (bool) false (@nil (bool))))).
