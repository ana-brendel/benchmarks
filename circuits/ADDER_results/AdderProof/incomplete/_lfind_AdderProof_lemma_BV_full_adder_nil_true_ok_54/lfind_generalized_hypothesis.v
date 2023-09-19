Load LFindLoad.
Load LFindLoad.
From Circuits Require Import AdderProof.

From lfind Require Import LFind.
From CircuitsCoqGym Require Import Adder. 

From QuickChick Require Import QuickChick.
QCInclude "/home/anabrendel/lfind/benchmarks/circuits/ADDER_tests/AdderProof/_lfind_AdderProof_lemma_BV_full_adder_nil_true_ok_54/".
QCInclude ".".
Extract Constant defNumTests => "50".
Derive Show for nat.

        Derive Arbitrary for nat.

        Instance Dec_Eq_nat : Dec_Eq nat.

        Proof. dec_eq. Qed.


Derive Show for bool.

        Derive Arbitrary for bool.

        Instance Dec_Eq_bool : Dec_Eq bool.

        Proof. dec_eq. Qed.


Require Import String. Open Scope string.

Definition show_type_name_BV (T : Type) := 
  match T with
  | bool => "bool"
  end.

Instance show_BV {T} `{_ : Show T} : Show (list T) := 
{| show := 
     let fix aux l :=
       match l with
       | nil => "@nil (" ++ show_type_name_BV T ++ ")" 
       | cons x xs => "@cons (" ++ show_type_name_BV T ++ ") " ++ show x ++ " (" ++ aux xs ++ ")"
       end
      in aux
|}.
Derive Arbitrary for list.
Instance Dec_Eq_BV {T} `{_ : Dec_Eq T}  : Dec_Eq (list T).
Proof. dec_eq. Qed.



Require Import String. Open Scope string.

Definition show_type_name (T : Type) := 
  match T with
  | bool => "bool"
  end.

Instance show_list {T} `{_ : Show T} : Show (list T) := 
{| show := 
     let fix aux l :=
       match l with
       | nil => "@nil (" ++ show_type_name T ++ ")" 
       | cons x xs => "@cons (" ++ show_type_name T ++ ") " ++ show x ++ " (" ++ aux xs ++ ")"
       end
      in aux
|}.
Derive Arbitrary for list.
Instance Dec_Eq_list {T} `{_ : Dec_Eq T}  : Dec_Eq (list T).
Proof. dec_eq. Qed.


Definition generalized_hypothesis : forall cin0 : bool,
@eq nat
  (BV_to_nat
     (BV_full_adder (@nil (bool)) (@cons (bool) true (@nil (bool))) cin0))
  (Nat.add (BV_to_nat (@nil (bool))) (bool_to_nat cin0)).
Admitted.
QuickChick generalized_hypothesis.