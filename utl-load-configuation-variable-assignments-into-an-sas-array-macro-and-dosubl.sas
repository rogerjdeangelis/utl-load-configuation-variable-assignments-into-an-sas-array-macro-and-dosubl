Load configuation variable assignments into an sas array macro and dosubl                                                      
                                                                                                                               
   Two Solutions                                                                                                               
                                                                                                                               
        a. macro code                                                                                                          
        b. dosubl code                                                                                                         
           I prefer this for maintainability and flexibility                                                                   
           datastep code is cleaner than macro code.                                                                           
                                                                                                                               
GitHub                                                                                                                         
https://tinyurl.com/y4ced7l9                                                                                                   
https://github.com/rogerjdeangelis/utl-load-configuation-variable-assignments-into-an-sas-array-macro-and-dosubl               
                                                                                                                               
SAS Forum                                                                                                                      
https://tinyurl.com/y4jtslbw                                                                                                   
https://communities.sas.com/t5/SAS-Programming/Create-New-vars-by-sequence-based-on-data-value-in-one-variable/m-p/682568      
                                                                                                                               
/*                   _                                                                                                         
(_)_ __  _ __  _   _| |_                                                                                                       
| | `_ \| `_ \| | | | __|                                                                                                      
| | | | | |_) | |_| | |_                                                                                                       
|_|_| |_| .__/ \__,_|\__|                                                                                                      
        |_|                                                                                                                    
*/                                                                                                                             
                                                                                                                               
  %let bones='                                                                                                                 
      RIB 1 RIGHT=1;RIB 1 LEFT=0;RIB 2 RIGHT=1;RIB 2 LEFT=0;RIB 3 RIGHT=0;RIB 3 LEFT=1;                                        
      RIB 4 RIGHT=0;RIB 4 LEFT=1;RIB 5 RIGHT=0;RIB 5 LEFT=1;RIB 6 RIGHT=0;RIB 6 LEFT=0;                                        
      RIB 7 RIGHT=0;RIB 7 LEFT=1;RIB 8 RIGHT=0;RIB 8 LEFT=0;RIB 9 RIGHT=0;RIB 9 LEFT=0;                                        
      RIB 10 RIGHT=0;RIB 10 LEFT=1;RIB 11 RIGHT=1;RIB 11 LEFT=1;RIB 12 RIGHT=0;RIB 12 LEFT=0;                                  
      STERNUM=0;CLAVICLE RIGHT=0;CLAVICLE LEFT=0;SCAPULA RIGHT=0;SCAPULA LEFT=1';                                              
                                                                                                                               
/*           _               _                                                                                                 
  ___  _   _| |_ _ __  _   _| |_                                                                                               
 / _ \| | | | __| `_ \| | | | __|                                                                                              
| (_) | |_| | |_| |_) | |_| | |_                                                                                               
 \___/ \__,_|\__| .__/ \__,_|\__|                                                                                              
                |_|                                                                                                            
*/                                                                                                                             
                                                                                                                               
Middle Observation(1 ) of want - Total Obs 1                                                                                   
                                                                                                                               
                                                                                                                               
 -- CHARACTER --                                                                                                               
Variable    Type/Length  Value                                                                                                 
                                                                                                                               
VAR1            C32      RIB 1 RIGHT=1                                                                                         
VAR2            C32      RIB 1 LEFT=0                                                                                          
VAR3            C32      RIB 2 RIGHT=1                                                                                         
VAR4            C32      RIB 2 LEFT=0                                                                                          
VAR5            C32      RIB 3 RIGHT=0                                                                                         
VAR6            C32      RIB 3 LEFT=1                                                                                          
VAR7            C32      RIB 4 RIGHT=0                                                                                         
VAR8            C32      RIB 4 LEFT=1                                                                                          
VAR9            C32      RIB 5 RIGHT=0                                                                                         
VAR10           C32      RIB 5 LEFT=1                                                                                          
VAR11           C32      RIB 6 RIGHT=0                                                                                         
VAR12           C32      RIB 6 LEFT=0                                                                                          
VAR13           C32      RIB 7 RIGHT=0                                                                                         
VAR14           C32      RIB 7 LEFT=1                                                                                          
VAR15           C32      RIB 8 RIGHT=0                                                                                         
VAR16           C32      RIB 8 LEFT=0                                                                                          
VAR17           C32      RIB 9 RIGHT=0                                                                                         
VAR18           C32      RIB 9 LEFT=0                                                                                          
VAR19           C32      RIB 10 RIGHT=0                                                                                        
VAR20           C32      RIB 10 LEFT=1                                                                                         
VAR21           C32      RIB 11 RIGHT=1                                                                                        
VAR22           C32      RIB 11 LEFT=1                                                                                         
VAR23           C32      RIB 12 RIGHT=0                                                                                        
VAR24           C32      RIB 12 LEFT=0                                                                                         
VAR25           C32      STERNUM=0                                                                                             
VAR26           C32      CLAVICLE RIGHT=0                                                                                      
VAR27           C32      CLAVICLE LEFT=0                                                                                       
VAR28           C32      SCAPULA RIGHT=0                                                                                       
VAR29           C32      SCAPULA LEFT=1                                                                                        
                                                                                                                               
/*         _       _   _                                                                                                       
 ___  ___ | |_   _| |_(_) ___  _ __  ___                                                                                       
/ __|/ _ \| | | | | __| |/ _ \| `_ \/ __|                                                                                      
\__ \ (_) | | |_| | |_| | (_) | | | \__ \                                                                                      
|___/\___/|_|\__,_|\__|_|\___/|_| |_|___/                                                                                      
  __ _     _ __ ___   __ _  ___ _ __ ___                                                                                       
 / _` |   | `_ ` _ \ / _` |/ __| `__/ _ \                                                                                      
| (_| |_  | | | | | | (_| | (__| | | (_) |                                                                                     
 \__,_(_) |_| |_| |_|\__,_|\___|_|  \___/                                                                                      
                                                                                                                               
*/                                                                                                                             
                                                                                                                               
%symdel bones items /nowarn;                                                                                                   
                                                                                                                               
proc datasets lib=work;                                                                                                        
 delete want;                                                                                                                  
run;quit;                                                                                                                      
                                                                                                                               
%let bones=                                                                                                                    
  "RIB 1 RIGHT=1;RIB 1 LEFT=0;RIB 2 RIGHT=1;RIB 2 LEFT=0;RIB 3 RIGHT=0;RIB 3 LEFT=1;                                           
  RIB 4 RIGHT=0;RIB 4 LEFT=1;RIB 5 RIGHT=0;RIB 5 LEFT=1;RIB 6 RIGHT=0;RIB 6 LEFT=0;                                            
  RIB 7 RIGHT=0;RIB 7 LEFT=1;RIB 8 RIGHT=0;RIB 8 LEFT=0;RIB 9 RIGHT=0;RIB 9 LEFT=0;                                            
  RIB 10 RIGHT=0;RIB 10 LEFT=1;RIB 11 RIGHT=1;RIB 11 LEFT=1;RIB 12 RIGHT=0;RIB 12 LEFT=0;                                      
  STERNUM=0;CLAVICLE RIGHT=0;CLAVICLE LEFT=0;SCAPULA RIGHT=0;SCAPULA LEFT=1";                                                  
                                                                                                                               
data want;                                                                                                                     
                                                                                                                               
  * META DATA SECTION;                                                                                                         
                                                                                                                               
  %let items=%eval(%sysfunc(countc(&bones,%str(;)))+1);                                                                        
                                                                                                                               
  * DATASTEP SECTION;                                                                                                          
                                                                                                                               
  array v $32 var1-var&items;                                                                                                  
                                                                                                                               
  do i=1 to dim(v);                                                                                                            
     v[i]=left(scan(compbl(&bones),i,";"));                                                                                    
  end;                                                                                                                         
                                                                                                                               
  output;                                                                                                                      
                                                                                                                               
  drop i;                                                                                                                      
  stop;                                                                                                                        
                                                                                                                               
run;quit;                                                                                                                      
                                                                                                                               
/*            _                 _     _                                                                                        
| |__      __| | ___  ___ _   _| |__ | |                                                                                       
| `_ \    / _` |/ _ \/ __| | | | `_ \| |                                                                                       
| |_) |  | (_| | (_) \__ \ |_| | |_) | |                                                                                       
|_.__(_)  \__,_|\___/|___/\__,_|_.__/|_|                                                                                       
                                                                                                                               
*/                                                                                                                             
                                                                                                                               
%symdel bones items /nowarn;                                                                                                   
                                                                                                                               
proc datasets lib=work;                                                                                                        
 delete want;                                                                                                                  
run;quit;                                                                                                                      
                                                                                                                               
%let bones=                                                                                                                    
  "RIB 1 RIGHT=1;RIB 1 LEFT=0;RIB 2 RIGHT=1;RIB 2 LEFT=0;RIB 3 RIGHT=0;RIB 3 LEFT=1;                                           
  RIB 4 RIGHT=0;RIB 4 LEFT=1;RIB 5 RIGHT=0;RIB 5 LEFT=1;RIB 6 RIGHT=0;RIB 6 LEFT=0;                                            
  RIB 7 RIGHT=0;RIB 7 LEFT=1;RIB 8 RIGHT=0;RIB 8 LEFT=0;RIB 9 RIGHT=0;RIB 9 LEFT=0;                                            
  RIB 10 RIGHT=0;RIB 10 LEFT=1;RIB 11 RIGHT=1;RIB 11 LEFT=1;RIB 12 RIGHT=0;RIB 12 LEFT=0;                                      
  STERNUM=0;CLAVICLE RIGHT=0;CLAVICLE LEFT=0;SCAPULA RIGHT=0;SCAPULA LEFT=1";                                                  
                                                                                                                               
data want;                                                                                                                     
                                                                                                                               
  * META DATA SECTION;                                                                                                         
                                                                                                                               
  if _n_=0 then do; %dosubl('                                                                                                  
                                                                                                                               
      data _null_;                                                                                                             
          items=countc(symget("bones"),";") + 1;                                                                               
          call symputx("items",items);                                                                                         
      run;                                                                                                                     
                                                                                                                               
      ');                                                                                                                      
  end;                                                                                                                         
                                                                                                                               
  * DATASTEP SECTION;                                                                                                          
                                                                                                                               
  array v $32 var1-var&items;                                                                                                  
                                                                                                                               
  do i=1 to dim(v);                                                                                                            
     v[i]=left(scan(compbl(&bones),i,";"));                                                                                    
  end;                                                                                                                         
  output;                                                                                                                      
  drop i;                                                                                                                      
  stop;                                                                                                                        
                                                                                                                               
run;quit;                                                                                                                      
                                                                                                                               
                                                                                                                               
