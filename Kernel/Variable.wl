(* ::Package:: *)

(* ::Section:: *)
(*Begin*)


BeginPackage["Yurie`Cartesian`Variable`"];


(*clear the states when loading.*)

ClearAll["`*"];


(* ::Section:: *)
(*Public*)


$coord::usage =
    "spacetime coordinates.";

$coordS::usage =
    "space coordinates.";

$coordT::usage =
    "time coordinates.";


$weight::usage =
    "weights of operators.";

$coordWeight::usage =
    "coord + weight.";

$coordDim::usage =
    "spacetime dimension.";

$coordAssociation::usage =
    "association of coordinates.";


$metric::usage =
    "metric.";

$metricMat::usage =
    "matrix of metric.";

$metricInv::usage =
    "inverse metric.";

$metricInvMat::usage =
    "matrix of inverse metric.";


(* ::Section:: *)
(*Private*)


(* ::Subsection:: *)
(*Begin*)


Begin["`Private`"];


(* ::Subsection:: *)
(*Main*)


(* ::Subsection:: *)
(*End*)


End[];


(* ::Section:: *)
(*End*)


EndPackage[];
