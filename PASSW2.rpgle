       ctl-opt main(PASSW2);                              
                                                         
      //TITLE PASSW2 - display a random password on screen
                                                         
       dcl-pr PASSWCALC varchar(10) end-pr;               
             //you must declare all subprocedures in the main module                                            
       dcl-f rpgdspf workstn;                             
       dcl-s done ind;                                    
                                                         
       dcl-proc PASSW2;                                   
         dcl-pi *N extpgm end-pi;                        
                                                          
         exfmt getname;                                  
                                                          
         done = '0';                                     
                                                          
         dow not done;                                   
            password = PASSWCALC;                        
                       //now you can use subprocedure like an internal function                         
            curtime = %time();                  
            exfmt showinfo;                     
            select;                             
               when *in05;                      
               // Refresh, handled automatically
                  password = PASSWCALC;         
               when *in03;                      
               // Exit                          
                  *inlr = '1';                  
                  return;                       
              
               other;                           
               // Just show the screen again    
            endsl;                              
         enddo;                                 
         close *ALL;                            
       end-proc;                                           
