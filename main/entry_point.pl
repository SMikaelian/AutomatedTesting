:- use_module('interpreter.pl').

program(Bound):-
    open('file.txt',write, Stream),
    forall(solve(Bound, [exp/1, stmt/1], stmt(X)), (write(Stream, X), write(Stream, "\n"))),
    close(Stream).
