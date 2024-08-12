(* ::Package:: *)

(* ::Section:: *)
(*Begin*)


BeginPackage["Yurie`Cartesian`Function`"];


Needs["Yurie`Cartesian`"];

Needs["Yurie`Cartesian`Variable`"];


(* ::Section:: *)
(*Public*)


coordQ::usage =
    "test whether is a spacetime coordinate.";

coordSQ::usage =
    "test whether is a space coordinate.";

coordTQ::usage =
    "test whether is a time coordinate.";


coordOrder::usage =
    "Order of coordinates.";

coordPart::usage =
    "Part according to coordinates.";

coordTable::usage =
    "Table according to coordinates.";

coordSum::usage =
    "Sum according to coordinates.";


(* ::Section:: *)
(*Private*)


(* ::Subsection:: *)
(*Begin*)


Begin["`Private`"];


(* ::Subsection:: *)
(*Main*)


coordQ[coords__] :=
    And@@Map[MemberQ[$coord,#]&,{coords}];

coordSQ[coords__] :=
    And@@Map[MemberQ[$coordS,#]&,{coords}];

coordTQ[coords__] :=
    And@@Map[MemberQ[$coordT,#]&,{coords}];


coordOrder[expr_] :=
    Replace[expr,$coordAssociation,{-1}];


coordPart[args___][expr_] :=
    Extract[
        expr,
        Replace[{args},$coordAssociation,{-1}]
    ];


coordTable//Attributes =
    {HoldFirst};

coordTable[component_,indexList_] :=
    Apply[
        Table[component,##]&,
        Map[{#,$coord}&,indexList]
    ];


coordSum//Attributes =
    {HoldFirst};

coordSum[component_,indexList_] :=
    Apply[
        Sum[component,##]&,
        Map[{#,$coord}&,indexList]
    ];


(* ::Subsection:: *)
(*End*)


End[];


(* ::Section:: *)
(*End*)


EndPackage[];
