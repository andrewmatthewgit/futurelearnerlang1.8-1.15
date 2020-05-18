
% Partially complete. No further time available at the moment to develop this



-module(filereading).
-export([get_file_contents/1,show_file_contents/1,lower/1]).



%%%%%% FILE NAME MUST BE IN INVERTED COMMAS IN FUNCTION CALLS


%%%% Erlang course assignmnet 3.3


% Used to read a file into a list of lines.
% Example files available in:
%   gettysburg-address.txt (short)
%   dickens-christmas.txt  (long)
  

% Get the contents of a text file into a list of lines.
% Each line has its trailing newline removed.
% the design goal is to take each line of txt read by get_file_contents (Course: 3.3) 

get_file_contents(Name) ->
    {ok,File} = file:open(Name,[read]),
    Rev = get_all_lines(File,[]),
    %lists:reverse(Rev),   
    T = lower(splitup(Rev)),
    Line = 1,
    X = scan(Line, T),
    io:format("The text is: ~s~n",[X]).


% scan through all the words, set them to lower case,

%Index each word 4 chrs by line and posn in line

% Scan for word in each line and make list of occurences 

%(scan forward and backwards after first line)

% Move to next word and repeat until all words scanned and List of occurences produced for each unique word by LIne/Posn in Line  
  
  scan(1,[]) -> [];
  scan(1, [L]) -> [1,1,L];
  scan (1,[L|Ls]) ->
                    
                    S = [1,1,[L] | scan (1,Ls)],
                    io:format("The scan is: ~p~n", [S]).

% Setup stream of lower case words for processing


lower([]) -> [];
lower([L|Ls]) ->
                case string:to_lower(L) of
                [_,_,_,_|_] = W -> [W|lower(Ls)];
                %io:format("~s~n",[W]);
                _ -> lower(Ls)
                end.
                
% split strings in to words

splitup([]) -> [];
splitup([L|Ls]) -> 
                string:tokens(L,",") ++ splitup(Ls).
 

% Not used so far

get_all_lines(File,Partial) ->
    case io:get_line(File,"") of
        eof -> file:close(File),
               Partial;
        Line -> {Strip,_} = lists:split(length(Line)-1,Line),
                get_all_lines(File,[Strip|Partial])
    end.

% Show the contents of a list of strings.
% Can be used to check the results of calling get_file_contents.

show_file_contents([L|Ls]) ->
    io:format("~s~n",[L]),
    show_file_contents(Ls);
 show_file_contents([]) ->
    ok.    
