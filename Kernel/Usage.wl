(* Coordinate.wl *)

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


(* Function.wl *)

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


(* Initiation.wl *)

initiateCartesian::usage =
	StringJoin["the first argument specifies the coordinates, and the last argument specifies the metric.\n", "PseudoInverse is used if the metric matrix is non-invertible."];