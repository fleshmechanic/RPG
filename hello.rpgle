     H dftactgrp(*no) bnddir('QC2LE')
       //Imports C Library

     D Random          PR            10U 0 extproc('rand')


       dcl-s Random_Idx int(10) ;
       dcl-s i int(5) ;
       dcl-s Random_func int(10) ;
       dcl-c chars 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789@' ;
       dcl-s result varchar(10) inz('') ;
       dcl-s tmp varchar(1) inz('') ;


       for i = 1 to 10 ;
        //Initialize the random function from the C Library
        Random_func = Random() ;

        //Generates a random index
        Random_Idx = %rem(Random_func:37) ;

        //Select a the char in the generated index and adds it to the result var
        tmp = %SUBST(chars:Random_Idx:1) ;
        result += tmp  ;
       endfor ;

       //Prints the result
       dsply ('Password is: ' + result) ;
       result = '';
       return ;
                    