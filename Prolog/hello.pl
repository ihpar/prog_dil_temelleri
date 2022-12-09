% tek satir yorum

/* 
çok satirli
yorum
*/

/*
:- initialization hello_world, halt.

hello_world :- write('Hello, World!'), nl.
% [hello]
*/

% say_hi :- write('Hello World'), nl.
/* 
consult(hello)
say_hi.
*/

/* 

Facts (Gerçekler)

ali insandır. -> insan(ali).
afrika sıcaktır. -> sıcak(afrika).
karpuzlar elmalardan büyüktür. -> büyük(karpuz, elma).
ayşe alinin annesidir. -> anne(ayşe, ali).

*/

% Facts
/*
insan(ali).
insan(ayse).
sicak(afrika).
buyuk(karpuz, elma).
buyuk(karpuz, cilek).
*/



% Rules (Kurallar)
/*
seviyor(romeo, juliet).
seviyor(juliet, romeo).
seviyor(thor, juliet).

sevgili(X, Y) :- seviyor(X, Y), seviyor(Y, X).
arkadasi(X, Y) :- seviyor(X, Y); seviyor(Y, X).
*/

/*
 ,   -> AND
 ;   -> OR
 :-  -> IF
 not -> NOT
*/

/*
annesi(ayse, ali).
annesi(fatma, ayse).
annesi(hayriye, fatma).
annesi(pakize, hayriye).

anneannesi(A, B) :-
  annesi(A, X), annesi(X, B).
*/

% çıkış -> halt.
% örnek query'ler (sorgular): 
/*
insan(ayse). 
insan(ayi). 
arkadasi(A, B). 
sevgili(K, L). 
anneannesi(hayriye, ali). 
*/