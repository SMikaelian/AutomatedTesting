:- module(definitions, [exp/1, myint/1, myString/1, bool/1, variable/1,
          null/1, stmt/1]).

myint(number(1)).
myint(number(2)).
myint(number(3)).

myString(string('sampleString')).
myString(string('sampleStriing')).
myString(string('sampleStringg')).

variable('VAR').
variable('VAR2').

null('null').

bool(true).
bool(false).
bool(and(E1, E2)):-
  exp(E1),
  exp(E2).
bool(or(E1, E2)):-
  exp(E1),
  exp(E2).
bool(not(E1)):-
  exp(E1).

op(lessThan(E1, E2)):-
  exp(E1),
  exp(E2).

op(grtrThan(E1, E2)):-
  exp(E1),
  exp(E2).

op(lessThanOrEqual(E1, E2)):-
  exp(E1),
  exp(E2).

op(grtrThanOrEqual(E1, E2)):-
  exp(E1),
  exp(E2).

op(equal(E1, E2)):-
  exp(E1),
  exp(E2).

op(notEqual(E1, E2)):-
  exp(E1),
  exp(E2).

op(plus(E1, E2)):-
  exp(E1),
  exp(E2).

op(minus(E1, E2)):-
    exp(E1), 
    exp(E2).

op(negate(E1, E2)):-
  exp(E1),
  exp(E2).

op(mult(E1, E2)):-
    exp(E1), 
    exp(E2).

exp(X):-
  myint(X);
  myString(X);
  bool(X);
  null(X);
  variable(X);
  op(X);
  comop(X). 
  

comop(ternary(E1, E2, E3)):-
	exp(E1),
	exp(E2),
	exp(E3).

stmt(X):- 
    exp(X).

stmt(while(E, S)):-
  exp(E),
  stmt(S).

stmt(do_while(S, E)):-
  stmt(S),
  exp(E).

stmt(for(E, S)):-
  exp(E),
  stmt(S).

stmt(for(S1, E, S2, Ss)):-
  stmt(S1),
  exp(E),
  stmt(S2),
  stmt(Ss).

stmt(assignment(Var, Exp)):-
    variable(Var),
    exp(Exp).

stmt(function(V1, V2, S)):-
  variable(V1),
  variable(V2),
  stmt(S). 

stmt(switch(E1, C1)):- 
  exp(E1), 
  caseGen(C1). 

varSet([]). 
varSet([H|T]):- 
  variable(H), 
  variable(T).

caseGen([]). 
caseGen([H|T]):- 
  case(H), 
  case(T). 

case(E1):- 
  exp(E1). 