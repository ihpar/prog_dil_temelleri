% elemani(A, L) iff A, L'nin elemaniysa basarili olur.
elemani(X, [X | Xs]).
elemani(Y, [X | Xs]) :- elemani(Y, Xs).

% elemani(3, [1,3,5]).
% elemani(A, [1,3,5]).

% sona_ekle(L1, Y, L2) iff L1'in sonuna Y eklenince L2'ye esit olusa basarili olur.
sona_ekle([], Y, [Y]).
sona_ekle([X|Xs], Y, [X|Ys]) :- sona_ekle(Xs, Y, Ys).

% sona_ekle([], 3, L).
% sona_ekle([1, 2], 3, L).

% birlestir(L1, L2, L3) iff L1, L2 ile birlestirilince ortaya cikan list L3 ise basarili olur.
birlestir([], L2, L2).
birlestir([X|Xs], L2, [X|Ys]) :- birlestir(Xs, L2, Ys). 

% birlestir([1, 2], [3, 4], L).
% birlestir([1, 2], X, [1, 2, 3, 4]).

% ters_cevir(L1, L2) iff L1'in tersi L2'ye esitse basarili olur.
ters_cevir([], []).
ters_cevir([X|Xs], Y) :- 
  ters_cevir(Xs, Z), birlestir(Z, [X], Y).

% ters_cevir([1, 2, 3], L).

% uzunluk(L, U) iff L'nin eleman sayisi U'ya esitse basarili olur.
uzunluk([], 0).
uzunluk([X|Xs], U) :- uzunluk(Xs, Usag), U is Usag + 1.

% uzunluk([1, 2, 3], X).

% rehber: [kisi(ali, 123), kisi(veli, 234), kisi(ayse, 123)]
ara(Ad, Numara, [kisi(Ad, Numara) | Gerisi]).
ara(Ad, Numara, [_ | Gerisi]) :- ara(Ad, Numara, Gerisi).

% query: ara(veli, Tel, [kisi(ali, 123), kisi(veli, 234), kisi(ayse, 123)]).

ara_2(Ad, Numara, [kisi(Ad, Numara) | Gerisi]) :- !.
ara_2(Ad, Numara, [_ | Gerisi]) :- ara_2(Ad, Numara, Gerisi).

% query'ler: elemani(2, [1, 2, 3, 2, 4]).
% izlemeyi başlatma "trace."
% izlemeyi durdurma "notrace."

elemani_2(X, [X | Xs]) :- !.
elemani_2(Y, [X | Xs]) :- elemani_2(Y, Xs).

% sorgular: elemani(2, [1, 2, 3, 2, 4]). elemani_2(2, [1, 2, 3, 2, 4]).

/*
?- X = 2+3.
X = 2+3.

?- X is 2+3.
X = 5.

N is N + 1. asla basarili olamaz!

X is Y + 1, Y = 3. => Hata!
Y = 3, X is Y + 1. => Basarili.
*/

factorial(0, 1) :- !.
factorial(X, Fact) :- 
  X > 0,
  X_1 is X - 1,
  factorial(X_1, X_1_Fact),
  Fact is X * X_1_Fact.

cift(X) :- 0 is X mod 2.

cift_2(X) :- (X mod 2) =:= 0.

karesi(X, Y) :- Y is X ** 2.

fibo(1, 1) :- !.
fibo(2, 1) :- !.
fibo(N, X) :-
  N > 2,
  N_1 is N - 1,
  N_2 is N - 2,
  fibo(N_1, F_1),
  fibo(N_2, F_2),
  X is F_1 + F_2.