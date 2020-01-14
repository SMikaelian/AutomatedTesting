%-------------------------------------Printer Rules for Generated Test Cases-------------------------------------
:- use_module('interpreter.pl').

program(Bound):- 
  forall(solve(Bound, [exp/1, stmt/1], stmt(X)), 
  printer(X, "printer.js")).

printer(Term, File):- 
setup_call_cleanup(open(File, append, In), 
                        print(Term, In), 
                        close(In)). 

print(Term, In):- 
    writer(In, Term).
    
writer(Stream, number(X)):-
  nl(Stream),
  write(Stream, X),
  nl(Stream).

writer(Stream, string(X)):-
  nl(Stream),
  atom_concat('"', X, R1),
  atom_concat(R1, '"', R2),
  write(Stream, R2),
  nl(Stream).

writer(Stream, plus(L, R)):-
  nl(Stream),
  write(Stream, '('),
  writer(Stream, L),
  write(Stream, '+'),
  writer(Stream, R),
  write(Stream, ')'),
  nl(Stream).

writer(Stream, minus(L, R)):-
  nl(Stream),
  write(Stream, '('),
  writer(Stream, L),
  write(Stream, '-'),
  writer(Stream, R),
  write(Stream, ')'),
  nl(Stream).

writer(Stream, mult(L, R)):-
  nl(Stream),
  write(Stream, '('),
  writer(Stream, L),
  write(Stream, '*'),
  writer(Stream, R),
  write(Stream, ')'),
  nl(Stream).
  
writer(Stream, negate(X)):-
  nl(Stream),
  write(Stream, '(-'),
  writer(Stream, X),
  write(Stream, ')'),
  nl(Stream).

writer(Stream, not(X)):-
  nl(Stream),
  write(Stream, '(!'),
  writer(Stream, X),
  write(Stream, ')'),
  nl(Stream).

writer(Stream, notEqual(L, R)):-
  nl(Stream),
  write(Stream, '('),
  writer(Stream, L),
  write(Stream, '!='),
  writer(Stream, R),
  write(Stream, ')'),
  nl(Stream).

writer(Stream, equal(L, R)):-
  nl(Stream),
  write(Stream, '('),
  writer(Stream, L),
  write(Stream, '=='),
  writer(Stream, R),
  write(Stream, ')'),
  nl(Stream).

writer(Stream, lessThan(L, R)):-
  nl(Stream),
  write(Stream, '('),
  writer(Stream, L),
  write(Stream, '<'),
  writer(Stream, R),
  write(Stream, ')'),
  nl(Stream).
  
writer(Stream, grtrThan(L, R)):-
  nl(Stream),
  write(Stream, '('),
  writer(Stream, L),
  write(Stream, '>'),
  writer(Stream, R),
  write(Stream, ')'),
  nl(Stream).

writer(Stream, lessThanOrEqual(L, R)):-
  nl(Stream),
  write(Stream, '('),
  writer(Stream, L),
  write(Stream, '<'),
  writer(Stream, R),
  write(Stream, ')'),
  nl(Stream).
  
writer(Stream, grtrThanOrEqual(L, R)):-
  nl(Stream),
  write(Stream, '('),
  writer(Stream, L),
  write(Stream, '>'),
  writer(Stream, R),
  write(Stream, ')'),
  nl(Stream).

writer(Stream, and(L, R)):-
  nl(Stream),
  write(Stream, '('),
  writer(Stream, L),
  write(Stream, '&&'),
  writer(Stream, R),
  write(Stream, ')'),
  nl(Stream).

writer(Stream, or(L, R)):-
  nl(Stream),
  write(Stream, '('),
  writer(Stream, L),
  write(Stream, '||'),
  writer(Stream, R),
  write(Stream, ')'),
  nl(Stream).

writer(_, _).