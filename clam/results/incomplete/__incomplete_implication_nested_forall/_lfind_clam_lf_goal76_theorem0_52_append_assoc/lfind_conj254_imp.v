Load LFindLoad.
Load LFindLoad.
From adtind Require Import goal76.

From lfind Require Import LFind.

From QuickChick Require Import QuickChick.
QCInclude "/home/anabrendel/lfind/benchmarks/clam/sources/_lfind_clam_lf_goal76_theorem0_52_append_assoc/".
QCInclude ".".
Extract Constant defNumTests => "50".
(* Open Scope string_scope.
Fixpoint show_natural n :=
    match n with
    | Zero => "Zero"
    | Succ m => "Succ (" ++ show_natural m ++ ")"
    end.

Instance show_natural_instance : Show natural := {| show := show_natural |}. *)

Derive Show for natural.

Derive Arbitrary for natural.

Instance Dec_Eq_natural : Dec_Eq natural.
Proof. dec_eq. Qed.

Derive Show for lst.

Derive Arbitrary for lst.

Instance Dec_Eq_lst : Dec_Eq lst.
Proof. dec_eq. Qed.

Derive Show for tree.

        Derive Arbitrary for tree.

        Instance Dec_Eq_tree : Dec_Eq tree.

        Proof. dec_eq. Qed.




(* Open Scope string_scope.
Fixpoint show_natural n :=
    match n with
    | Zero => "Zero"
    | Succ m => "Succ (" ++ show_natural m ++ ")"
    end.

Instance show_natural_instance : Show natural := {| show := show_natural |}. *)
(* 
Derive Show for natural.

Derive Arbitrary for natural.

Instance Dec_Eq_natural : Dec_Eq natural.
Proof. dec_eq. Qed. *)


Lemma conj254_imp: forall (lf8 : lst) (x1 : tree) (y : lst) (x2 : tree) (n : natural), forall _ : forall y0 : lst, @eq lst (lfappend lf8 y0) (qrevaflat x1 y0),
@eq lst (lfappend (lfappend lf8 (Cons n (revflat x2))) y)
  (qrevaflat x1 (Cons n (qrevaflat x2 y))).
Admitted.
QuickChick conj254_imp.