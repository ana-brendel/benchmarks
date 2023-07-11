Load LFindLoad.
Load LFindLoad.
From TreeAutomata Require Import base.

From lfind Require Import LFind.
Require Import Arith.
Require Import BinNat.
From IntMap Require Import Allmaps.

Lemma lfind_state {A}  (a : A) (e : A) (x : ad) (x0 : ad) : @eq ad x x0.
Admitted.

From QuickChick Require Import QuickChick.
QCInclude "/home/anabrendel/lfind/benchmarks/tree-automata/_lfind_lemma_Neqb_complete_274/".
QCInclude ".".
Extract Constant defNumTests => "50".
Derive Show for bool.

        Derive Arbitrary for bool.

        Instance Dec_Eq_bool : Dec_Eq bool.

        Proof. dec_eq. Qed.


Derive Show for Map A.

        Derive Arbitrary for Map A.

        Instance Dec_Eq_Map A : Dec_Eq Map A.

        Proof. dec_eq. Qed.




Derive Show for option.

        Derive Arbitrary for option.

        Instance Dec_Eq_option : Dec_Eq option A.

        Proof. dec_eq. Qed.

Notation A := nat.


Open Scope string_scope.

Parameter print : ad -> string -> ad.
Extract Constant print => "Extract.print".
Definition collect_data (a : A) (e : A) (x : ad) (x0 : ad) :=
 let lfind_var := "a:" ++ "(" ++ show a ++ ")"++ "|" ++"e:" ++ "(" ++ show e ++ ")"++ "|" ++"x:" ++ "(" ++ show x ++ ")"++ "|" ++"x0:" ++ "(" ++ show x0 ++ ")"
 in let lfind_v := print x0 lfind_var
 in lfind_state a e x lfind_v.
QuickChick collect_data.
Success.