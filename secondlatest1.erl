-module(secondlatest1).

-export([double/1,mult/2,areaold/3,square/1,freq/2,even/1,freq2/1,doublelist/1,treble/1,mode/1,hypot/2,encl/1,perimtriangle/2,maxThree/3,howManyEqual/3,bits/1,fib/1,pieces/1,area/1,perim/1]).

% Erlang 2.18


%doublelist/1 to double elements in a list of numbers

doublelist ([]) -> [];
doublelist([X|Xs])
                -> [X*2 | doublelist(Xs)].



% even/1 to extract even numbers from list of numbers

even([]) -> [];

even([X|Xs]) when (X rem 2) > 0
                ->               
                [even(Xs)];
                
even([X|Xs])
                ->               
                [X | even(Xs)].



% following functions are under development (mode, freq and median)


% median/1 take median of a list of numbers 


% to try in due course




% worker func for mode

freq(_X, []) -> [];
freq(X, [Y|Ys]) when X == Y
                ->  
                S = 1,
                [[S,X]|freq(X,Ys)];
                
freq(X, [_Y|Ys]) 
                ->  
                S = 0,
                [[S,X]|freq(X,Ys)].
                

%freq2([]) -> [];
       
%freq2([X|Xs]) when X == 0
             %   ->                              
               % freq2([Xs]);
                
%freq2([X|_Xs]) when X == 1
               % -> 
               % X.
     
                
        
% mode/1 most frquently numbers in a list

mode([]) -> [];


                
mode([X|Xs])
                ->               
                [freq(X,[Xs])].




% Erlang Futurelearn Week 2 Assignment


area ({circle, {_X,_Y},R})
    -> math:pi() *R*R;
area ({rectangle, {_X,_Y},H,W})
    -> H*W;
area ({triangle, {_X,_Y},B,H,_S1,_S2})
    -> (B*H)/2.
    
perim({circle,{_X,_Y},R})
    -> math:pi() *2*R;
perim({rectangle,{_X,_Y},H,W})  
    -> ((H*2) + (W*2));
perim({triangle,{_X,_Y},B,_H,S1,S2})
    -> B+S1+S2.
    


%enclose/1 for smallest enclosing rectangle

encl({circle,{_X,_Y},R})
    -> 
    L = R+R,
    H = R+R,
    io:format("The required rectangle has sides :~p ~p~n", [L,H]);

encl({rectangle,{_X,_Y},H,W})  
   ->
    io:format("The required rectangle has sides :~p ~p ~n", [H,W]);

encl({triangle,{_X,_Y},B,H,_S1,_S2}) 
   ->    
   io:format("The required rectangle has sides:~p ~p ~n", [B,H]).
		   


% Sum number of 1 bits in a number when converted to base 2

bits(0) -> 0;
bits(N)
    -> (N rem 2) + bits(N div 2).




% Updated for Futurelearn Erlang 1.15


mult(X,Y) ->

    X*Y.



double(X) ->

    mult(2,X).



areaold(A,B,C) ->

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
        



    


		
