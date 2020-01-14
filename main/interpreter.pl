:- module(interpreter, [solve/3]).
:- use_module('definitions.pl').

% Interpreter to implement randomness, and bound.
decBound(B, NB):-
  B > 0,
  NB is B - 1.

solve(_, _, true):- !.

solve(Bound, List, (A; B)):- 
	(solve(Bound, List, A));
	(solve(Bound, List, B)).

solve(Bound, List, (A, B)):-
  !,  
  (solve(Bound, List, A),
  solve(Bound, List, B)).

solve(B, List, X):-
    isMember(List, X) ->
      decBound(B, NB),
      handler(NB, List, X);
      handler(B, List, X).

handler(B, List, X):-
  findall(pair(X, Body), clause(X, Body), CallBodyPairs),
  random_permutation(CallBodyPairs, Mutated),
  member(pair(X, Body), Mutated),
  solve(B, List, Body).

isMember(List, X):-
  functor(X, Name, Arity),
  member(Name/Arity, List).

