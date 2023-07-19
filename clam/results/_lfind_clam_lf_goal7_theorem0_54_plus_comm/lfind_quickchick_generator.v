Load LFindLoad.
Load LFindLoad.
From adtind Require Import goal7.

From lfind Require Import LFind.

Lemma lfind_state   (n0 : natural) (n : natural) (y : lst) (x : lst) : @eq natural (len (qreva x (Cons n (Cons n0 y))))
  (Succ (plus (len x) (Succ (len y)))).
Admitted.

From QuickChick Require Import QuickChick.
QCInclude "/home/anabrendel/lfind/benchmarks/clam/sources/_lfind_clam_lf_goal7_theorem0_54_plus_comm/".
QCInclude ".".
Extract Constant defNumTests => "50".
Derive Show for lst.

        Derive Arbitrary for lst.

        Instance Dec_Eq_lst : Dec_Eq lst.

        Proof. dec_eq. Qed.




Derive Show for natural.

        Derive Arbitrary for natural.

        Instance Dec_Eq_natural : Dec_Eq natural.

        Proof. dec_eq. Qed.



Open Scope string_scope.

Parameter print : lst -> string -> lst.
Extract Constant print => "Extract.print".
Definition collect_data (n0 : natural) (n : natural) (y : lst) (x : lst) :=
 let lfind_var := "n0:" ++ "(" ++ show n0 ++ ")"++ "|" ++"n:" ++ "(" ++ show n ++ ")"++ "|" ++"y:" ++ "(" ++ show y ++ ")"++ "|" ++"x:" ++ "(" ++ show x ++ ")"
 in let lfind_v := print x lfind_var
 in lfind_state n0 n y lfind_v.
QuickChick collect_data.
Success.