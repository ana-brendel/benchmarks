Load LFindLoad.
From lfind Require Import LFind.
Require Import Arith.
From adtind Require Import goal50.

Set Printing Depth 1000.
Unset Printing Notations.
Set Printing Implicit.

Definition lfind_eval  :=
if lfeqb x x then Succ (count l x) else count l x.

Compute lfind_eval .
