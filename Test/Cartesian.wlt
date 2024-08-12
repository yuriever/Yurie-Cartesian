

(*Cartesian.nb*)

VerificationTest[
	Begin["Global`"];
	ClearAll["`*"]
	,
	Null
	,
	TestID->"0-Cartesian.nb"
]

VerificationTest[
	Get["Yurie`Cartesian`"]
	,
	Null
	,
	TestID->"1-Cartesian.nb"
]

VerificationTest[
	initiateCartesian[{{}, {x1, x2}}, {Δ}, {{-1, 0}, {0, 1}}]
	,
	Null
	,
	TestID->"2-Cartesian.nb"
]

VerificationTest[
	super[a]
	,
	{x1a, x2a}
	,
	TestID->"3-Cartesian.nb"
]

VerificationTest[
	sub[b]
	,
	{-x1b, x2b}
	,
	TestID->"4-Cartesian.nb"
]

VerificationTest[
	square[a, b]
	,
	(-x1a)*x1b + x2a*x2b
	,
	TestID->"5-Cartesian.nb"
]

VerificationTest[
	super[] . sub[] === square[]
	,
	True
	,
	TestID->"6-Cartesian.nb"
]

VerificationTest[
	coordTable[metric[i, j], {i, j}] === metricMat
	,
	True
	,
	TestID->"7-Cartesian.nb"
]

VerificationTest[
	metricMat . metricInvMat === IdentityMatrix[coordDim]
	,
	True
	,
	TestID->"8-Cartesian.nb"
]

VerificationTest[
	coordDim === Length[coord]
	,
	True
	,
	TestID->"9-Cartesian.nb"
]

VerificationTest[
	coordOrder[x1 < x2]
	,
	True
	,
	TestID->"10-Cartesian.nb"
]

VerificationTest[
	(coordPart[x1][#1] === #1[[1]] & )[{a, b}]
	,
	True
	,
	TestID->"11-Cartesian.nb"
]

VerificationTest[
	vars[a, b]
	,
	{{x1a, x1b}, {x2a, x2b}, {Δa, Δb}}
	,
	TestID->"12-Cartesian.nb"
]

VerificationTest[
	vars[{a, b}, {a, b, c, d}]
	,
	{{x1a, x1b}, {x2a, x2b}, {Δa, Δb, Δc, Δd}}
	,
	TestID->"13-Cartesian.nb"
]

VerificationTest[
	pats[a, b]
	,
	{{x1a_, x1b_}, {x2a_, x2b_}, {Δa_, Δb_}}
	,
	TestID->"14-Cartesian.nb"
]

VerificationTest[
	ClearAll["`*"];
	End[]
	,
	"Global`"
	,
	TestID->"∞-Cartesian.nb"
]