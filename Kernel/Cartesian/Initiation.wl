(* ::Package:: *)

(* ::Section:: *)
(*Begin*)


BeginPackage["Yurie`Cartesian`Initiation`"];


Needs["Yurie`Cartesian`"];

Needs["Yurie`Cartesian`Variable`"];


(* ::Section:: *)
(*Public*)


initiateCartesian::usage =
    "the first argument specifies the coordinates, and the last argument specifies the metric.\n"<>
    "PseudoInverse is used if the metric matrix is non-invertible."


(* ::Section:: *)
(*Private*)


(* ::Subsection:: *)
(*Begin*)


Begin["`Private`"];


(* ::Subsection:: *)
(*Message*)


initiateCartesian::dimdismatch =
    "the dimensions from coordinates and metric do not match.";

initiateCartesian::metricnoinverse =
    "the metric is not invertible and pseudo-inverse is used.";


(* ::Subsection:: *)
(*Main*)


initiateCartesian[coordInput:{{___Symbol},{___Symbol}},metricMatInput_?MatrixQ] :=
    (
        checkDimensionMatch[coordInput,metricMatInput];
        clearCoordWeightMetric[];
        initiateCoordMetric[coordInput,metricMatInput];
        initiateWeight[{}];
    );


initiateCartesian[coordInput:{{___Symbol},{___Symbol}},weightInput:{___Symbol},metricMatInput_?MatrixQ] :=
    (
        checkDimensionMatch[coordInput,metricMatInput];
        clearCoordWeightMetric[];
        initiateCoordMetric[coordInput,metricMatInput];
        initiateWeight[weightInput];
    );


initiateCartesian[] :=
    (
        clearCoordWeightMetric[];
    );


(* ::Subsection:: *)
(*Helper*)


checkDimensionMatch[coordInput_,metricMatInput_] :=
    If[ Length@Flatten@coordInput=!=Length@metricMatInput,
        Message[initiateCartesian::dimdismatch];
        Abort[]
    ];


initiateCoordMetric[coordInput_,metricMatInput_] :=
    (
        (*set the coordinates.*)
        $coord =
            Flatten@coordInput;
        $coordS =
            coordInput[[2]];
        $coordT =
            coordInput[[1]];
        $coordDim =
            Length@$coord;
        $coordAssociation =
            AssociationThread[$coord->Range@Length@$coord];
        (*set the metric.*)
        $metricMat =
            metricMatInput;
        $metricInvMat =
            Quiet@Check[
                Inverse@$metricMat,
                PseudoInverse@$metricMat,
                {Inverse::sing}
            ];
        Clear@$metric;
        Clear@$metricInv;
        Evaluate@Outer[$metric,$coord,$coord] =
            $metricMat;
        Evaluate@Outer[$metricInv,$coord,$coord] =
            $metricInvMat;
    );


initiateWeight[weightInput_] :=
    (
        $weight =
            weightInput;
        $coordWeight =
            Join[$coord,$weight];
    );


clearCoordWeightMetric[] :=
    Clear[
        $coord,$coordS,$coordT,
        $weight,$coordWeight,$coordDim,$coordAssociation,
        $metric,$metricInv,$metricInvMat,$metricMat
    ];


(* ::Subsection:: *)
(*End*)


End[];


(* ::Section:: *)
(*End*)


EndPackage[];
