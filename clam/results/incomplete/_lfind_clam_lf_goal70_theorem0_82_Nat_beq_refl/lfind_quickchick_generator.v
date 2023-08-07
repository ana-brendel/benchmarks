Load LFindLoad.
Load LFindLoad.
From adtind Require Import goal70.

From lfind Require Import LFind.

Lemma lfind_state   (n : natural) (y : lst) (x : natural) : @eq natural
  (if lfeqb x x
   then Succ (if lfeqb x n then Succ (count y x) else count y x)
   else if lfeqb x n then Succ (count y x) else count y x) 
  (Succ (count y x)).
Admitted.

From QuickChick Require Import QuickChick.
QCInclude "/home/anabrendel/lfind/benchmarks/clam/sources/_lfind_clam_lf_goal70_theorem0_82_Nat_beq_refl/".
QCInclude ".".
Extract Constant defNumTests => "50".
Derive Show for bool.

        Derive Arbitrary for bool.

        Instance Dec_Eq_bool : Dec_Eq bool.

        Proof. dec_eq. Qed.




Derive Show for lst.

        Derive Arbitrary for lst.

        Instance Dec_Eq_lst : Dec_Eq lst.

        Proof. dec_eq. Qed.


Derive Show for natural.

        Derive Arbitrary for natural.

        Instance Dec_Eq_natural : Dec_Eq natural.

        Proof. dec_eq. Qed.



Open Scope string_scope.

Parameter print : natural -> string -> natural.
Extract Constant print => "Extract.print".
Definition collect_data (n : natural) (y : lst) (x : natural) :=
 let lfind_var := "n:" ++ "(" ++ show n ++ ")"++ "|" ++"y:" ++ "(" ++ show y ++ ")"++ "|" ++"x:" ++ "(" ++ show x ++ ")"
 in let lfind_v := print x lfind_var
 in lfind_state n y lfind_v.
QuickChick collect_data.
Success.