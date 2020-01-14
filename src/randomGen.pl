%This allows random search or generation.


interp(Call):-
  findall(pair(Call, Body), clause(Call, Body), CallBodyPairs),
  randomPermutation(CallBodyPairs, Mutated),
  member(pair(Call, Body), Mutated),
  interp(Body).