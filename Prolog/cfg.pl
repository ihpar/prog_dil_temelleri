% https://www.metalevel.at/prolog/dcg
:- set_prolog_flag(double_quotes, chars).

her_zaman_dogru :- true.

her_zaman_yanlis :- fail.

yaz :- write('Hello').

yazdir :- write('Yanlis'), fail.

% el_at(L, X, N) iff L'nin N'inci elemani X ise basarili olur.
el_at([X | _], X, 0) :- !.
el_at([_ | Rest], X, Y) :-
  el_at(Rest, X, Z),
  Y is Z + 1.

% len(L, X) iff L dizisindeki eleman sayisi X ise basarilidir.
len([], 0).
len([_ | Rest], X) :- 
  len(Rest, Y),
  X is Y + 1.

% top(L, X) iff Listedeki elemanlarin toplami X'e esitse basarili olur.
top([X], X) :- !.
top([X | Rest], Y) :-
  top(Rest, Z),
  Y is X + Z.

% ort(L, X) iff L'nin aritmetik ortalamasi X ise basarilidir.
ort(L, X) :- 
  len(L, U), 
  top(L, T), 
  X is T / U.

% uzaklik(p1, p2) iff p1 ve p2 arasindaki uzaklik ekrana yazilirsa basarilidir.
uzaklik((X1, Y1), (X2, Y2)) :-
  D is sqrt((X1 - X2) ** 2 + (Y1 - Y2) ** 2),
  write('Verilen noktalar arasi uzaklik = '), write(D), nl. 

% uzaklik((1, 2), (4, 6)).

% yazdir(C, N) iff N tane C karakteri yan yana yazdirilirsa basarilidir.
yazdir(C, 1) :- write(C), !.
yazdir(C, N) :- 
  N > 1,
  write(C),
  N_1 is N - 1, 
  yazdir(C, N_1).

% dikdortgen(W, H) iff W genisliginde H yuksekliginde *'lardan olusan bir dikdorgen yazdidirsa basarilidir.
dikdortgen(W, 1) :- yazdir('*', W), !.
dikdortgen(W, H) :- 
  H > 1,
  yazdir('*', W), nl,
  H_1 is H - 1,
  dikdortgen(W, H_1).

% kare(X) iff ekranda *'lardan olusan kenar uzunlugu X olan bir kare gorursek basarilidir'.
kare(W) :- dikdortgen(W, W).

% concat(L1, L2, L3) iff L1 listesinin devamına L2 listesi eklendiğinde L3 listesi elde ediliyorsa.
concat([], L1, L1).
concat([X | Rest], L1, [X | Rest2]) :-
  concat(Rest, L1, Rest2). 

% aralik(A, B, L) iff L, A'dan B'ye kadar olan sayilarin listesi ise basarili olur.
aralik(A, B, L) :- 
  A > B,
  L = [],
  !.

aralik(A, B, L) :- 
  A =< B,
  X is A + 1,
  aralik(X, B, L2),
  concat([A], L2, L).

% definite clause grammar (DCG)

% L(G) = {a, aa, aaa, ...} -> a^n, n >= 1
as --> [a].
as --> [a], as.
% phrase(as, L).
% phrase(as, "aaa").
% phrase(as, "aaba").


% a^nb^n, n >= 0 -> ε, ab, aabb, aaabbb, ...
% S -> aSb | ε
anbn --> [].
anbn --> [a], anbn, [b].

% L(G) = {aa, bb, abba, aabbaa, ...} S -> aSa | bSb | ε
mirror --> [].
mirror --> [a], mirror, [a].
mirror --> [b], mirror, [b].

% len(L, 4), !, phrase(mirror, L).

% L(G) binary stringler {0, 1, 01, 10, 11. ...}
binary --> [].
binary --> [1], binary.
binary --> [0], binary.

% len(L, 3), !, phrase(binary, L).

% L = a^n b^2n, n >= 1 = {abb, aabbbb, aaabbbbbb, ...}
anbtn --> [].
anbtn --> [a], anbtn, [b, b].

% phrase(anbtn, L).

% L = a^n, n >= 1
% Muglak, ambiguous
ambas --> [].
ambas --> [a], ambas.
ambas --> ambas, [a].

% phrase(ambas, "aaa"). HATA! Çıkmak için a ENTER.