% Odevinizi "ogrenci_numaraniz.pl" seklinde zip'leyiniz.
% Ziplediginiz dosyayi (ogrenci_numaraniz.zip) email ile 15 Ocak 2023 Saat 23:59'a kadar gonderiniz.
% Prolog terminalinde "not_hesapla." seklinde bir sorgu calistirdiginizda muhtemel notunuzu gorebilirsiniz.
% Gercek notunuz hesaplanirken bu dosyadakinden farkli test case'ler calistirilabilir.
% Gonderdiginiz odev "not_hesapla." sorgusu ile calistirilmak istenirken bir HATA verir ve calismazsa odevden puan alamazsiniz! (warning'ler onemli degildir.)

% Ad Soyad:
% Numara:


% Gerekirse asagidaki alandaki iliskileri cozumunuzde kullanabilirsiniz.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Degistirilemez alan baslangici %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% len(L, U) eger L listesinin uzunlugu U ise basarili olur.
len([], 0).
len([_|Xs], U) :- len(Xs, Usag), U is Usag + 1.

% concat(L1, L2, L3) eger L1 listesi ile L2 listesi birlestirilince ortaya L3 listesi cikiyorsa basarili olur.
concat([], L2, L2).
concat([X|Xs], L2, [X|Ys]) :- concat(Xs, L2, Ys). 

% reverse(L1, L2) eger L1 listesi ters cevrildiginde L2 listesi ortaya cikiyorsa basarili olur.
reverse([], []).
reverse([X|Xs], Y) :- 
  reverse(Xs, Z), concat(Z, [X], Y).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Degistirilemez alan bitisi. %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%% Odev Baslangici %%%%%%%%%%%%%%%%%%%%%%%%
% Bu alanda istediginiz tum degisiklikleri yapabilirsiniz. 
% Gerektiginde yardimci iliskiler tanimlayabilirsiniz.
% Gerektiginde yukarda verilen yardimci iliskileri kullanabilirsiniz.

% Soru 1) ilk_gorulme(X, L, N) eger L listesi icinde X elemani ilk N'inci indekste goruluyorsa basarili olur.
% Indeksleme 0'dan baslar. 
% L icinde X'in kesinlikle bulunacagini farz ediniz.
% Orn: ilk_gorulme(3, [7, 3, 5], 1) basarilidir. ilk_gorulme(4, [1, 3, 4, 4], 2) basarilir.
ilk_gorulme(_, _, -999).

% Soru 2) son_gorulme(X, L, N) eger L listesi icinde X elemani en son N'inci indekste goruluyorsa basarili olur.
% Indeksleme 0'dan baslar. 
% L icinde X'in kesinlikle bulunacagini farz ediniz.
% Orn: son_gorulme(3, [1, 3, 5, 2, 3, 2], 4) basarilidir. son_gorulme(4, [1, 3, 4, 4, 5], 3) basarilir.
son_gorulme(_, _, -999).

% Soru 3) yogunluk(L, X) eger L listesinin icindeki cift sayilarin miktari, tek sayilarin miktarindan fazlayken X, 2 ise;
% L listesinin icindeki tek sayilarin miktari, cift sayilarin miktarindan fazlayken X, 1 ise;
% L listesinin icindeki tek sayilarin miktari, cift sayilarin miktarina esitken X, 0 ise basarilidir.
% Orn: yogunluk([0, 1, 2, 3], 0) basarilidir. yogunluk([0, 1, 3, 3], 1) basarilidir.
% Orn: yogunluk([0, 1, 2, 4], 2) basarilidir. yogunluk([3], 1) basarilidir. yogunluk([], 0) basarilidir.
yogunluk(_, -999).

% Soru 4) en_buyuk_fark(L, F) eger L listesi icindeki 2 sayi arasindaki olabilecek en buyuk fark F ise basarilidir.
% L listesinde en az 2 sayi olacagini farz ediniz.
% Orn: en_buyuk_fark([1, 3, 5, 6], 5) basarilidir. en_buyuk_fark([3, 5, 1, 7, 4, 5, -9, 6, -1], 16) basarilidir.
en_buyuk_fark(_, -999).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%% Odev Bitisi %%%%%%%%%%%%%%%%%%%%%%%%
% Buradan sonraki alanda degisiklik yapmayiniz.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

check(X, X, 1) :- !.
check(_, _, 0) :- !.

sum_all([X], X).
sum_all([Y|Ys], Z) :-
  sum_all(Ys, K),
  Z is Y + K. 

grade(L, X) :-
  sum_all(L, S),
  len(L, U),
  X is 100 * S / U.

not_hesapla :-
  ilk_gorulme(1, [1, 2, 3, 4, 2], Ilk1),
  ilk_gorulme(2, [1, 2, 3, 4, 2], Ilk2),
  son_gorulme(1, [1, 2, 3, 4, 2], Son1),
  son_gorulme(2, [1, 2, 3, 4, 2], Son2),
  yogunluk([], Yo1),
  yogunluk([3], Yo2),
  yogunluk([0, 1, 2, 3], Yo3),
  yogunluk([0, 2, 4, 5], Yo4),
  en_buyuk_fark([0, 0], F1),
  en_buyuk_fark([0, 1, 5, -1], F2),
  en_buyuk_fark([-1, -2, -3, -4], F3),
  en_buyuk_fark([20, 10, -10, 15], F4),
  check(Ilk1, 0, T0),
  check(Ilk2, 1, T1),
  check(Son1, 0, T2),
  check(Son2, 4, T3),
  check(Yo1, 0, T4),
  check(Yo2, 1, T5),
  check(Yo3, 0, T6),
  check(Yo4, 2, T7),
  check(F1, 0, T8),
  check(F2, 6, T9),
  check(F3, 3, T10),
  check(F4, 30, T11),
  grade([T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11], Grade),
  write('Notunuz: '), write(Grade), nl, !.