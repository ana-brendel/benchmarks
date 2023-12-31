Load LFindLoad.
Load LFindLoad.
From adtind Require Import goal62.

From lfind Require Import LFind.
Require Import Arith.

Lemma lfind_state   (n0 : natural) (n : natural) (y : natural) (x : lst) : (@eq lst x x) /\ (@eq natural y y) /\ (@eq natural n n) /\ (@eq natural n0 n0).
Admitted.

From QuickChick Require Import QuickChick.
QCInclude "/home/anabrendel/lfind/benchmarks/clam/sources/_lfind_clam_lf_goal62_theorem0_75_not_less/".
QCInclude ".".
Extract Constant defNumTests => "150".


Derive Show for bool.

        Derive Arbitrary for bool.

        Instance Dec_Eq_bool : Dec_Eq bool.

        Proof. dec_eq. Qed.


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


Open Scope string_scope.

Parameter print : lst -> string -> lst.
Extract Constant print => "Extract.print".
Definition collect_data (n0 : natural) (n : natural) (y : natural) (x : lst) :=
 let lfind_var := "n0:" ++ "(" ++ show n0 ++ ")"++ "|" ++"n:" ++ "(" ++ show n ++ ")"++ "|" ++"y:" ++ "(" ++ show y ++ ")"++ "|" ++"x:" ++ "(" ++ show x ++ ")"
 in let lfind_v := print x lfind_var
 in lfind_state n0 n y lfind_v.
QuickChick collect_data.
Success.