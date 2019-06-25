; --- Copyright Jason Diaz 2016. All rights reserved. -----------------
; File:      project3JDiaz.j
; Author:    Jason Diaz, 5/06/2016
; Purpose: This class receives input from the user, then
;  interacts with various methods in the AsciiOperations class
;  to manipulate the input. It loops taking two letters over and
;  over again and outputting the results of the ascii code
;  comparison. Returns -1 if the sum is less than the sum of my 
;  initials (JD = 142) 0 if the sum is equal and 1 if the sum is
;  greater than the sum my initials.
; -------------------------------------------------------------------------
.source                  project3JDiaz.java
.class                   project3JDiaz
.super                   java/lang/Object


.method                  public <init>()V
   .limit stack          1
   .limit locals         1
   .var 0 is             this Lproject3JDiaz/Proj3; from LABEL0x0 to LABEL0x5
LABEL0x0:
   aload_0               
   invokespecial         java/lang/Object/<init>()V
   return                
LABEL0x5:
.end method              

.method                  public static main([Ljava/lang/String;)V
   .limit stack          3
   .limit locals         5
   .var 0 is             args [Ljava/lang/String; from LABEL0x0 to LABEL0x2c
   .var 1 is             scanner Ljava/util/Scanner; from LABEL0xb to LABEL0x2c
   .var 2 is             letters Ljava/lang/String; from LABEL0x18 to LABEL0x2c
   .var 3 is             sum I from LABEL0x1d to LABEL0x2c
   .var 4 is             comparision I from LABEL0x23 to LABEL0x2c
LABEL0x0:
   new                   java/util/Scanner
   dup                   
   getstatic             java/lang/System/in Ljava/io/InputStream;
   
;  create a scanner so we can read the command-line input
   invokespecial         java/util/Scanner/<init>(Ljava/io/InputStream;)V
   astore_1              
LABEL0xb: ; start of loop
   getstatic             java/lang/System/out Ljava/io/PrintStream;
   
;  prompt for the user
   ldc                   "Enter two letters: "
   invokevirtual         java/io/PrintStream/print(Ljava/lang/String;)V
   aload_1          
   
;  get their input as a String
   invokevirtual         java/util/Scanner/next()Ljava/lang/String;
   astore_2              
LABEL0x18:
   aload_2       
   
;  call method to get the sum as an int   
   invokestatic          project3JDiaz/Proj3/asciiSum(Ljava/lang/String;)I
   istore_3              
LABEL0x1d:
   iload_3          
   
;  call method to compare to get an int
   invokestatic          project3JDiaz/Proj3/sumComparison(I)I
   istore                4
LABEL0x23:

;  print out the result from the comparison
   getstatic             java/lang/System/out Ljava/io/PrintStream;
   iload                 4
   invokevirtual         java/io/PrintStream/println(I)V
goto   LABEL0xb
   return                
LABEL0x2c:
.end method              


; asciiSum --
;  integer method that takes the two letters
;  and returns the sum of their ascii codes
; @param letters - which contains the two letter
; @return an int, the sum of the ascii codes
.method                  private static asciiSum(Ljava/lang/String;)I
   .limit stack          2
   .limit locals         5
   .var 0 is             letters Ljava/lang/String; from LABEL0x0 to LABEL0x16
   .var 1 is             char1 C from LABEL0x6 to LABEL0x16
   .var 2 is             ascii1 I from LABEL0x8 to LABEL0x16
   .var 3 is             char2 C from LABEL0xe to LABEL0x16
   .var 4 is             ascii2 I from LABEL0x11 to LABEL0x16
LABEL0x0:
   aload_0               
   iconst_0              
   invokevirtual         java/lang/String/charAt(I)C
   istore_1              
LABEL0x6:
   iload_1               
   istore_2              
LABEL0x8:
   aload_0               
   iconst_1              
   invokevirtual         java/lang/String/charAt(I)C
   istore_3              
LABEL0xe:
   iload_3               
   istore                4
LABEL0x11:
   iload_2               
   iload                 4
   iadd                  
   ireturn               
LABEL0x16:
.end method ; end asciiSum method             

; sumComparison --
;  takes the sum and returns -1 if the sum is less
;  than the sum of my initials (JD)
;  0 if the sum is equal and 1 if the sum is greater
;  than the sum my initials
; @param sum - the sum of the ascii codes
; @return an int, depends on the comparison
.method                  private static sumComparison(I)I
   .limit stack          2
   .limit locals         2
   .var 0 is             sum I from LABEL0x0 to LABEL0x10
   .var 1 is             initials Ljava/lang/Integer; from LABEL0x7 to LABEL0x10
LABEL0x0:
   sipush                142
   invokestatic          java/lang/Integer/valueOf(I)Ljava/lang/Integer;
   astore_1              
LABEL0x7:
   iload_0               
   invokestatic          java/lang/Integer/valueOf(I)Ljava/lang/Integer;
   aload_1               
   invokevirtual         java/lang/Integer/compareTo(Ljava/lang/Integer;)I
   ireturn               
LABEL0x10:
.end method ; end sumComparison method         
