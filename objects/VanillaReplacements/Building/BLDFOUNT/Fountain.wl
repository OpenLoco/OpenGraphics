(* ::Package:: *)

\[Phi]:=(1+Sqrt[5])/2 (*golden ratio*)

r1=1/2*(1-1/\[Phi]);
r2=r1/2;
r3=1/2*(1-1/\[Phi])+1/\[Phi];
r4=r3+1/2 (1-1/\[Phi]);
r5=\[Phi]-1-1/4 (1-1/\[Phi]);
a=1/2;

(*funtion, describing the outline of the fountain's structure*)
h[x_]:=a+Sqrt[r2^2-(x-r2)^2]/;x<r1
h[x_]:=a+0/;x>=r1&&x<r3
h[x_]:=a+Sqrt[r2^2-(x-r3-r2)^2]/;x>=r3&&x<r4
h[x_]:=a+(1+r5-r2)/2*Sin[((x-1)/(1+r5-r2)-1/2) \[Pi]]+(1+r5-r2)/2/;x>=r4&&x<r4+1+r5-r2
h[x_]:=a+1+r5-r2+Sqrt[r2^2-(x-(r4+1+r5))^2]/;x>=r4+1+r5-r2

Plot[h[x],{x,0,3},PlotRange->Full]


(* definitions of structure's color and of the water color*)
FountainCol=RGBColor[160.5/255,128.1/255,110.7/255]
WaterCol=RGBColor[90/255,136/255,143/255]


(* a box for norm for standardization the perspective *)
Rahmen={EdgeForm[(*{Thick,Blue}*)],Opacity[0],Cuboid[{-3.75,-3.75,0},{3.75,3.75,3}]};

Show[
	Graphics3D[{EdgeForm[],Rahmen},Boxed->False,ViewProjection->"Orthographic",ViewPoint->{1,-1,1},Lighting->{{"Directional",White,{0,0,2}},{"Ambient",GrayLevel[0.5]}},Lighting->"Neutral"],
	(*the revolution plots of the outline*)
	RevolutionPlot3D[
		{h[x],x},{x,0,r4+1+r5+r2},
		AxesLabel->{"x","y","z"},
		MaxRecursion->5,
		RevolutionAxis->"Z",
		PlotRange->All,
		Mesh->None,
		Boxed->False,
		Axes->False,
		PlotStyle->{FountainCol},
		Lighting->{{"Directional",White,{0,0,2}},{"Ambient",GrayLevel[0.5]}},
		Lighting->"Neutral"
	],
	(* rim of the lower part of the fountain*)
	RevolutionPlot3D[
		{f[x],2 r2*\[Phi]},{x,Exp[1]-r1,Exp[1]+r1},
		AxesLabel->{"x","y","z"},
		MaxRecursion->6,
		RevolutionAxis->"Z",
		PlotRange->All,
		Mesh->None,
		Boxed->False,
		Axes->False,
		PlotStyle->{FountainCol},
		Lighting->{{"Directional",White,{0,0,2}},{"Ambient",GrayLevel[0.5]}},
		Lighting->"Neutral"
	],
	RevolutionPlot3D[
		{Exp[1]-r1,x},{x,0,2 r2*\[Phi]},
		AxesLabel->{"x","y","z"},
		MaxRecursion->3,
		RevolutionAxis->"Z",
		PlotRange->All,
		Mesh->None,
		Boxed->False,
		Axes->False,
		PlotStyle->{FountainCol},
		Lighting->{{"Directional",White,{0,0,2}},{"Ambient",GrayLevel[0.5]}},
		Lighting->"Neutral"
	],
	RevolutionPlot3D[
		{Exp[1]+r1,x},{x,0,2*r2*\[Phi]},
		AxesLabel->{"x","y","z"},
		MaxRecursion->3,
		RevolutionAxis->"Z",
		PlotRange->All,
		Mesh->None,
		Boxed->False,
		Axes->False,
		PlotStyle->{FountainCol},
		Lighting->{{"Directional",White,{0,0,2}},{"Ambient",GrayLevel[0.5]}},
		Lighting->"Neutral"
	],
	(* water level in the upper part *)
	RevolutionPlot3D[
		{x,r4+1+r5+r2},{x,0,a+1+r5-r2},
		AxesLabel->{"x","y","z"},
		MaxRecursion->3,
		RevolutionAxis->"Z",
		PlotRange->All,
		Mesh->None,
		Boxed->False,
		Axes->False,
		PlotStyle->{WaterCol},
		Lighting->{{"Directional",White,{0,0,2}},{"Ambient",GrayLevel[0.5]}},
		Lighting->"Neutral"
	],
	(* water level in the lower part *)
	RevolutionPlot3D[
		{x,0},{x,0,Exp[1]},
		AxesLabel->{"x","y","z"},
		MaxRecursion->3,
		RevolutionAxis->"Z",
		PlotRange->All,
		Mesh->None,
		Boxed->False,
		Axes->False,
		PlotStyle->{WaterCol},
		Lighting->{{"Directional",White,{0,0,2}},{"Ambient",GrayLevel[0.5]}},
		Lighting->"Neutral"
	]
]
