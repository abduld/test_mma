iCollatz = Function[{Typed[n, "Integer64"]},
  Module[{m, Typed[list, TypeSpecifier["PackedArray"]["Integer64", 1]] = {n}},
  m = n;
  While[m > 1,
   m = If[Mod[m, 2] === 0, Quotient[m, 2], 3*m + 1];
   AppendTo[list, m]]; list]
 ];
{time, Collatz} = AbsoluteTiming[FunctionCompile[iCollatz]];

Print["Compiling Collatz took ", UnitConvert[time*Quantity[$TimeUnit, "Seconds"], "Milliseconds"]]

Print[10 -> Collatz[10]];
Print[20 -> Collatz[20]];


iMakeTable = Function[Typed[len, "MachineInteger"], Table[i, {i, len}]];
{time, MakeTable} = AbsoluteTiming[FunctionCompile[iMakeTable]];

Print["Compiling MakeTable took ", UnitConvert[time*Quantity[$TimeUnit, "Seconds"], "Milliseconds"]]

Print[10 -> MakeTable[10]];
Print[20 -> MakeTable[20]];
