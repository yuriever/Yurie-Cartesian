(* ::Package:: *)

(* ::Section:: *)
(*Begin*)


BeginPackage["Yurie`Cartesian`Coordinate`"];


Needs["Yurie`Cartesian`"];

Needs["Yurie`Cartesian`Variable`"];


(* ::Section:: *)
(*Public*)


coord::usage =
    "spacetime coordinates.";

coordS::usage =
    "space coordinates.";

coordT::usage =
    "time coordinates.";


coordDim::usage =
    "spacetime dimension.";


weight::usage =
    "weights of operators.";

coordWeight::usage =
    "coord + weight.";


vars::usage =
    "multiple coordinates and weights.";

pats::usage =
    "patterns of multiple coordinates and weights.";


metric::usage =
    "metric.";

metricMat::usage =
    "matrix of metric.";

metricInv::usage =
    "inverse metric.";

metricInvMat::usage =
    "matrix of inverse metric.";


super::usage =
    "list: x^a.";

sub::usage =
    "list: x_a.";

square::usage =
    "x^a y_a or x^a x_a.";


super2::usage =
    "x^a.";

sub2::usage =
    "x_a.";


(* ::Section:: *)
(*Private*)


(* ::Subsection:: *)
(*Begin*)


Begin["`Private`"];


(* ::Subsection:: *)
(*Main*)


(* ::Text:: *)
(*coordinates and weights*)


coord :=
    $coord;

coordS :=
    $coordS;

coordT :=
    $coordT;


coordDim :=
    $coordDim;


weight :=
    $weight;

coordWeight :=
    $coordWeight;


vars[indices___] :=
    indexize[$coordWeight,{indices}];

vars[indexList_List] :=
    indexize[$coord,indexList];

vars[{},indexList_List] :=
    indexize[$weight,indexList];

vars[indexList1_List,indexList2_List] :=
    Join[
        indexize[$coord,indexList1],
        indexize[$weight,indexList2]
    ];


pats[args___] :=
    Quiet@Replace[
        vars[args],
        variable_Symbol:>Pattern[variable,_],
        {-1}
    ];


(* ::Text:: *)
(*symbols involving metric*)


metric :=
    $metric;

metricMat :=
    $metricMat;

metricInv :=
    $metricInv;

metricInvMat :=
    $metricInvMat;


super[n_:Null] :=
    indexize[$coord,n];

sub[n_:Null] :=
    $metricMat . indexize[$coord,n];

square[n_:Null] :=
    indexize[$coord,n] . $metricMat . indexize[$coord,n];

square[n_,m_] :=
    indexize[$coord,n] . $metricMat . indexize[$coord,m];


super2[x_,n_:Null] :=
    indexize[x,n];

sub2[x_,n_:Null] :=
    coordPart[x][$metricMat . indexize[$coord,n]];


(* ::Subsection:: *)
(*Helper*)


indexize::usage =
    "indexize a list of variables."

indexize[var_,index_] :=
    singleIndexOnVariable[var,index];

indexize[var_,indexList_List] :=
    Map[singleIndexOnVariable[var,#]&,indexList];

indexize[varList_List,index_] :=
    Map[singleIndexOnVariable[#,index]&,varList];

indexize[varList_List,indexList_List] :=
    Outer[singleIndexOnVariable,varList,indexList];


singleIndexOnVariable[var_,Null] :=
    ToExpression@var;

singleIndexOnVariable[var_,index_String] :=
    ToExpression[
        ToString@var<>index
    ];

singleIndexOnVariable[var_,index_Symbol] :=
    ToExpression[
        ToString@var<>SymbolName@index
    ];

singleIndexOnVariable[var_,index_Integer] :=
    ToExpression[
        ToString@var<>ToString@index
    ];


(* ::Subsection:: *)
(*End*)


End[];


(* ::Section:: *)
(*End*)


EndPackage[];
