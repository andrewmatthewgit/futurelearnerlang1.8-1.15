-module(second).

-export([double/1,mult/2,area/3,square/1,treble/1,hypot/2,perimtriangle/2,maxThree/3,howManyEqual/3,fib/1,pieces/1]).

% Updated for Futurelearn Erlang 1.15


mult(X,Y) ->

    X*Y.



double(X) ->

    mult(2,X).



area(A,B,C) ->

    S = (A+B+C)/2,

    math:sqrt(S*(S-A)*(S-B)*(S-C)).

square(X) ->

    mult(X,X).

treble(X) ->

    mult(3,X).

hypot(X,Y) ->
    math:sqrt((X*X)+(Y*Y)).

perimtriangle(X,Y) ->
    hypot(X,Y) + X + Y.
           
maxThree (X,Y,Z) ->
    S = max(X,Y),
    max (S,Z).
    
% Tried to find a syntax that allowed func name to be left out after first line but none of my ideas worked

howManyEqual (X,X,X) -> 3;
howManyEqual (X,X,_) -> 2;
howManyEqual(X,_,X) -> 2;
howManyEqual(_,X,X) -> 2;
howManyEqual(_,_,_) -> 0.
    
    
fib(0) ->
        0;
fib(N) ->
        N+ fib(N-1).
        
% fib(4) = 4 + fib(3)    fib(3) = 3 + fib(2)   fib(2) = 2 + fib(1)  fib(1) = 1 + fib(0) = 1 + 0 = 1
        % hence fib(4) = 1 + 2 + + 3 + 4 = 10
        
pieces(0) ->
        0;
pieces(N) ->
        N + pieces(N-1).
    
        
		   
		
