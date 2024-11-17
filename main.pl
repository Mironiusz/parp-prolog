% Definicja dynamicznych predykatów, które będą modyfikowane w trakcie gry
:- dynamic(player_location/1).
:- dynamic(player_inventory/1).
:- dynamic(party_inventory/1).
:- dynamic(player_money/1).
:- dynamic(guest_list/1).
:- dynamic(game_state/1).
:- dynamic(party_quality/1).
:- dynamic(guests_count/1).

:- dynamic(npc/2).
:- dynamic(positioned_item/2).

% Początkowa lokalizacja gracza
player_location(pokoj_marka).

% Początkowy stan inwentarza gracza
player_inventory([]).
party_inventory([]).
guest_list([]).

% Początkowa ilość pieniędzy gracza
player_money(0).
game_state(0).
party_quality(0).
guests_count(0).
/* Definicja lokalizacji */
% map(Nazwa)

map(pokoj_babci).
map(targowek).
map(makro).
map(wydzial).
map(domowka).
map(drzwi_wejsciowe).

% location(Nazwa).

% Lokacja startowa: Pokój Marka
location(pokoj_marka).

% Pokój Babci
location(pokoj_babci).

% Targówek i okoliczne ulice
location(targowek).
location(jorskiego).
location(radzyminska).
location(blokowa).
location(ogrodnicza).

% Sklep Makro i jego alejki
location(makro).
location(alejka_alkohol).
location(alejka_jedzenie).
location(alejka_napoje).
location(palarnia_smietnik).

% Wydział i jego pomieszczenia
location(wydzial).
location(pietro_16).
location(piwnica).
location(piwnica_piwnicy).
location(sala_wykladowa).
location(korytarz_1_pietro).
location(meski_kibel).
location(damski_kibel).
location(wietnam).
location(laboratorium_komputerowe).
location(laboratorium_sieciowe).

% Domówka - kluczowe miejsca
location(domowka).
location(epicka_lazienka).
location(parkiet).
location(drzwi_wejsciowe).


/* Definicja połączeń między lokalizacjami */
% connection(Z_lokalizacji, Do_lokalizacji, Kierunek)

% Połączenia z Pokojem Marka
connection(pokoj_marka, pokoj_babci, east).
connection(pokoj_marka, targowek, south).

connection(pokoj_babci, makro, south).

% Połączenia na Targówku
connection(jorskiego, radzyminska, south).
connection(jorskiego, blokowa, west).

connection(radzyminska, jorskiego, north).
connection(radzyminska, blokowa, west).

connection(blokowa, jorskiego, east).
connection(blokowa, radzyminska, south).
connection(blokowa, ogrodnicza, north).

connection(ogrodnicza, blokowa, south).
connection(ogrodnicza, makro, north). % Tutaj idziemy do Makro


% Połączenia w Makro
connection(alejka_alkohol, alejka_napoje, west).
connection(alejka_alkohol, alejka_jedzenie, east).
connection(alejka_alkohol, palarnia_smietnik, south).
connection(alejka_jedzenie, alejka_alkohol, west).
connection(alejka_jedzenie, alejka_napoje, south).
connection(alejka_jedzenie, palarnia_smietnik, north).
connection(alejka_napoje, alejka_alkohol, north).
connection(alejka_napoje, alejka_jedzenie, south).
connection(alejka_napoje, palarnia_smietnik, west).
connection(palarnia_smietnik, alejka_alkohol, nort).
connection(palarnia_smietnik, alejka_jedzenie, west).
connection(palarnia_smietnik, alejka_napoje, east).
connection(palarnia_smietnik, wydzial, south). % Tutaj idziemy na wydział

% Połączenia na Wydziale
connection(pietro_16, piwnica_piwnicy, north).
connection(wietnam, piwnica_piwnicy, west).
connection(sala_wykladowa, korytarz_1_pietro, south).
connection(laboratorium_komputerowe, piwnica, west).

connection(piwnica, piwnica_piwnicy, south).
connection(piwnica, korytarz_1_pietro, north).
connection(piwnica, laboratorium_komputerowe, east).

connection(piwnica_piwnicy, piwnica, north).
connection(piwnica_piwnicy, pietro_16, south).
connection(piwnica_piwnicy, wietnam, east).
connection(piwnica_piwnicy, damski_kibel, west).

connection(laboratorium_sieciowe, meski_kibel, east).
connection(meski_kibel, laboratorium_sieciowe, west).
connection(meski_kibel, korytarz_1_pietro, north).

connection(korytarz_1_pietro, meski_kibel, north).
connection(korytarz_1_pietro, piwnica, west).
connection(korytarz_1_pietro, sala_wykladowa, east).
connection(korytarz_1_pietro, domowka, south). % Tutaj idziemy do domu Marka

% Połączenia w Domu Marka
connection(epicka_lazienka, parkiet, east).
connection(parkiet, epicka_lazienka, north).
connection(parkiet, drzwi_wejsciowe, south).


/* Definicja przedmiotów */
% positioned_item(Nazwa, Location).
    % pokoj marka
positioned_item(giga_okularki, pokoj_marka).
positioned_item(koszulka_z_amppz, pokoj_marka).

    % pokoj babci


    % targowek
positioned_item(fags, jorskiego).
positioned_item(beer_strong_cup, jorskiego).
positioned_item(metal_rod, jorskiego).
positioned_item(brick, jorskiego).
positioned_item(french_key, radzyminska).
positioned_item(knuckle_duster, radzyminska).
positioned_item(kebab, radzyminska).
positioned_item(trash, radzyminska).
positioned_item(baseball, blokowa).
positioned_item(kings_tulip, blokowa).
positioned_item(normal_beer, blokowa).
positioned_item(iqos, blokowa).
positioned_item(methanol, ogrodnicza).
positioned_item(syringe, ogrodnicza).
positioned_item(newspaper, ogrodnicza).
positioned_item(drinking_monkey, ogrodnicza).

    % macro
positioned_item(bison, alejka_alkohol).
positioned_item(jungle_ghost, alejka_alkohol).
positioned_item(jager, alejka_alkohol).
positioned_item(harnold, alejka_alkohol).
positioned_item(komandos, alejka_alkohol).
positioned_item(orzech, alejka_alkohol).
positioned_item(smerf, alejka_alkohol).
positioned_item(pepperoni, alejka_jedzenie).
positioned_item(hawaii, alejka_jedzenie).
positioned_item(lays_solone, alejka_jedzenie).
positioned_item(lays_papryka, alejka_jedzenie).
positioned_item(doritos_ser, alejka_jedzenie).
positioned_item(cheetos_ketchup, alejka_jedzenie).
positioned_item(pepsi, alejka_napoje).
positioned_item(cola, alejka_napoje).
positioned_item(rebull_z_makro, alejka_napoje).
positioned_item(tiger, alejka_napoje).
positioned_item(kong_strong, alejka_napoje).
positioned_item(vizir, palarnia_smietnik).
positioned_item(persil, palarnia_smietnik).
positioned_item(perwool, palarnia_smietnik).
positioned_item(ciasteczka_smiechu, palarnia_smietnik).
positioned_item(kosmiczny_papierek, palarnia_smietnik).

    % domowka
positioned_item(suprise, epicka_lazienka).
positioned_item(szybkie_okularki, parkiet).


% fight_item(name, healing_effect, damage_effect).
    % pokoj marka
fight_item(giga_okularki, 0, 5).
fight_item(koszulka_z_amppz, 0, 100).

    % targowek
fight_item(fags, 10, 1).
fight_item(beer_strong_cup, 0, 5).
fight_item(metal_rod, 0, 25).
fight_item(brick, 0, 15).
fight_item(french_key, 0, 8).
fight_item(knuckle_duster, 0, 5).
fight_item(kebab, 25, 0).
fight_item(trash, 0, 1).
fight_item(baseball, 0, 10).
fight_item(kings_tulip, 0, 5).
fight_item(normal_beer, 10, 0).
fight_item(iqos, 5, 0).
fight_item(methanol, 40, 0).
fight_item(syringe, 0, 15).
fight_item(newspaper, 0, 0).
fight_item(drinking_monkey, 20, 0).

    % prezenty
fight_item(pusta_puszka, 0, 0).
fight_item(szalik_legii, 0, 10).
fight_item(pusta_butelka, 0, 0).
fight_item(zoladkowa_gorzka, 10, 5).
fight_item(sloik, 0, 0).
fight_item(duzy_czarny_kogut, 20, 15).
fight_item(flaga_lecha, 0, 0).
fight_item(gaz_pieprzowy, 0, 20).
fight_item(opaska_do_wlosow, 0, 0).
fight_item(czapka_wpierdolka, 0, 15).
fight_item(bialko, 5, 0).
fight_item(strzykawka_ze_sterydami, 0, 25).
fight_item(zeszyt_od_matmy, 0, 0).
fight_item(karta_wzorow_na_analize, 0, 15).
fight_item(algorytm_genetyczny, 0, 0).
fight_item(siec_neuronowa, 0, 30).
fight_item(puszka_piwa, 3, 0).
fight_item(blue_curacao, 15, 10).
fight_item(puste_piwo_kraftowe, 0, 0).
fight_item(tulipan_po_zubrowce, 0, 10).
fight_item(pusta_strzykawka, 0, 0).
fight_item(pelna_strzykawka, 0, 20).
fight_item(zelda_na_nintendo_switch, 0, 0).
fight_item(rude_wlosy, 0, 10).
fight_item(pelna_puszka, 5, 1).
fight_item(karty_wzorow_na_amppzty, 0, 5).
fight_item(sajgonki_na_fakture, 20, 15).
fight_item(mleko_od_starego, 0, 0).
fight_item(jabol_w_puszce, 10, 5).
fight_item(szachy, 0, 0).
fight_item(baniak_jabola, 15, 10).
fight_item(cegla, 0, 15).
fight_item(baseball, 0, 25).
fight_item(projekt_zespolowy_1, 0, 0).
fight_item(projekt_pap, 0, 15).
fight_item(ptysie, 0, 5).
fight_item(projekt_risc_v_na_arko, 0, 30).

    % domowka
fight_item(suprise, 1, 8).
fight_item(szybkie_okularki, 10, 0).

% money_item(name, price).
money_item(szczeka, 100).


% party_item(name, price, quality).
party_item(bison, 5, 1).
party_item(jungle_ghost, 10, 2).
party_item(jager, 50, 25).
party_item(harnold, 5, 1).
party_item(komandos, 5, 2).
party_item(orzech, 25, 15).
party_item(smerf, 20, 5).
party_item(pepperoni, 15, 6).
party_item(hawaii, 15, 1).
party_item(lays_solone, 10, 5).
party_item(lays_papryka, 10, 6).
party_item(doritos_ser, 20, 8).
party_item(cheetos_ketchup, 15, 4).
party_item(pepsi, 3, 1).
party_item(cola, 3, 2).
party_item(rebull_z_makro, 7, 3).
party_item(tiger, 6, 2).
party_item(kong_strong, 6, 1).
party_item(vizir, 6, 6).
party_item(persil, 5, 5).
party_item(perwool, 8, 8).
party_item(ciasteczka_smiechu, 10, 10).
party_item(kosmiczny_papierek, 20, 40).

/* Definicja postaci NPC */
% npc(Nazwa, Localization).
npc(babcia, pokoj_babci).

    % cpuny kibole
npc(krzemarz, jorskiego). 
npc(jacus, jorskiego). 
npc(sobix, jorskiego). 
npc(traba, jorskiego). 
npc(krolik, jorskiego).
npc(strozyk, jorskiego). 
npc(witus, jorskiego). 
npc(kozuch, radzyminska). 
npc(swieczka, radzyminska). 
npc(krol_julian, radzyminska). 
npc(sliwka, radzyminska). 
npc(duzy_eryk, radzyminska). 
npc(bialy_crook, blokowa). 
npc(chudy, blokowa). 
npc(jeziorak, blokowa). 
npc(niespodzianka, blokowa). 
npc(charkacz, ogrodnicza). 
npc(mariusz, ogrodnicza). 
npc(grabie, ogrodnicza). 
npc(gracjan, ogrodnicza). 

    % studenci
npc(karol_wietnam, wietnam).
npc(martynka, sala_wykladowa).
npc(kopytek, sala_wykladowa).
npc(piotrek, piwnica).
npc(bartek, piwnica).
npc(jureczek, piwnica_piwnicy).
npc(tomek, piwnica_piwnicy).
npc(wojtek, piwnica_piwnicy).
npc(macius, laboratorium_komputerowe).
npc(olek, laboratorium_komputerowe).
npc(kubus, laboratorium_komputerowe).
npc(rafalek, laboratorium_sieciowe).
npc(lukasz_2, laboratorium_sieciowe).
npc(krzysiu, meski_kibel).
npc(mikolaj, meski_kibel).
npc(jasiulek, meski_kibel).
npc(mati, korytarz_1_pietro).
npc(wiktor, korytarz_1_pietro).
npc(adrian, epicka_lazienka).


% prezent(name, expectedItem, weak, strong).
prezent(rafalek, komandos, pusta_puszka, szalik_legii).
prezent(kubus, jager, pusta_butelka, zoladkowa_gorzka).
prezent(macius, rebull_z_makro, sloik, duzy_czarny_kogut).
prezent(krzysiu, harnold, flaga_lecha, gaz_pieprzowy).
prezent(tomek, smerf, opaska_do_wlosow, czapka_wpierdolka).
prezent(mikolaj, perwool, bialko, strzykawka_ze_sterydami).
prezent(martynka, hawaii, zeszyt_od_matmy, karta_wzorow_na_analize).
prezent(olek, jungle_ghost, algorytm_genetyczny, siec_neuronowa).
prezent(jureczek, bison, puszka_piwa, blue_curacao).
prezent(bartek, kong_strong, puste_piwo_kraftowe, tulipan_po_zubrowce).
prezent(wojtek, kosmiczny_papierek, pusta_strzykawka, pelna_strzykawka).
prezent(kopytek, lays_papryka, zelda_na_nintendo_switch, rude_wlosy).
prezent(jasiulek, harnold, pusta_puszka, pelna_puszka).
prezent(karol_wietnam, pepperoni, karty_wzorow_na_amppzty, sajgonki_na_fakture).
prezent(lukasz_2, persil, mleko_od_starego, jabol_w_puszce).
prezent(mati, ciasteczka_smiechu, szachy, baniak_jabola).
prezent(piotrek, cheetos_ketchup, cegla, baseball).
prezent(wiktor, doritos_ser, projekt_zespolowy_1, projekt_pap).
prezent(dziewczyny, orzech, ptysie, projekt_risc_v_na_arko).


/* descriptions and dialogs */

% generic description(name).
description(Name) :-
    name(Name, Desc),
    write(Desc), nl.

% name(var, name).
% Lokalizacje
name(pokoj_marka, 'Pokój Marka').
name(pokoj_babci, 'Pokój babci').
name(targowek, 'Targówek').
name(jorskiego, 'Ulica Jórskiego').
name(radzyminska, 'Ulica Radzymińska').
name(blokowa, 'Ulica Blokowa').
name(ogrodnicza, 'Ulica Ogrodnicza').
name(makro, 'Sklep Makro').
name(alejka_alkohol, 'Alejka z alkoholami').
name(alejka_jedzenie, 'Alejka z jedzeniem').
name(alejka_napoje, 'Alejka z napojami').
name(palarnia_smietnik, 'Palarnia przy śmietniku').
name(wydzial, 'Wydział').
name(pietro_16, '16 piętro').
name(piwnica, 'Piwnica').
name(piwnica_piwnicy, 'Piwnica piwnicy').
name(sala_wykladowa, 'Sala wykładowa').
name(korytarz_1_pietro, 'Korytarz na pierwszym piętrze').
name(meski_kibel, 'Męska toaleta').
name(damski_kibel, 'Damska toaleta').
name(wietnam, 'Wietnam').
name(laboratorium_komputerowe, 'Laboratorium komputerowe').
name(laboratorium_sieciowe, 'Laboratorium sieciowe').
name(domowka, 'Domówka').
name(epicka_lazienka, 'Epicka łazienka').
name(parkiet, 'Parkiet').
name(drzwi_wejsciowe, 'Drzwi wejściowe').

% Postacie
    % mapa pokoj babci
name(babcia, 'Babcia').

    % mapa targowek
name(krzemarz, 'Krzemarz').
name(jacus, 'Jacuś').
name(sobix, 'Sobix').
name(traba, 'Trąba').
name(krolik, 'Królik').
name(strozyk, 'Stróżyk').
name(witus, 'Wituś').
name(kozuch, 'Kożuch').
name(swieczka, 'Świeczka').
name(sliwka, 'Śliwka').
name(krol_julian, 'Król Julian').
name(duzy_eryk, 'Duży Eryk').
name(niespodzianka, 'Niespodzianka'). 
name(bialy_crook, 'Biały Crook'). 
name(chudy, 'Chudy').
name(charkacz, 'Charkacz'). 
name(jeziorak, 'Jeziorak').
name(mariusz, 'Mariusz'). 
name(grabie, 'Grabie').
name(gracjan, 'Gracjan').


    % mapa wydzial
name(adrian, 'Adrian').
name(karol_wietnam, 'Karol z Wietnamu').
name(martynka, 'Martynka').
name(kopytek, 'Kopytek').
name(piotrek, 'Piotrek'). 
name(bartek, 'Bartek').
name(jureczek, 'Jureczek'). 
name(tomek, 'Tomek').
name(wojtek, 'Wojtek').
name(macius, 'Maciuś'). 
name(olek, 'Olek').
name(kubus, 'Kubuś (Frontend)'). 
name(rafalek, 'Rafałek').
name(lukasz_2, 'Łukasz 2'). 
name(krzysiu, 'Krzysiu').
name(mikolaj, 'Mikołaj').
name(jasiulek, 'Jasiulek').
name(mati, 'Mati').
name(wiktor, 'Wiktor').


name(andrzej, 'Andżej').

% itemy

    % pokoj marka
name(giga_okularki, 'Giga okularki').
name(koszulka_z_amppz, 'Koszulka z AMPPZ').

    % pokoj babci

    % targowek
name(fags, 'Szlugi').
name(beer_strong_cup, 'Kuflowe Mocne').
name(metal_rod, 'Metalowy pręt').
name(brick, 'Cegła').
name(french_key, 'Klucz francuza').
name(knuckle_duster, 'Kastecik').
name(kebab, 'Kebab').
name(trash, 'Śmieci').
name(baseball, 'Baseballi').
name(kings_tulip, 'Tulipan').
name(normal_beer, 'Piwo').
name(iqos, 'IQos').
name(methanol, 'Metanol').
name(syringe, 'Strzykawka').
name(newspaper, 'Gazeta').
name(drinking_monkey, 'Małpka z żabki').

    % makro
name(bison, 'Żubrówka').
name(jungle_ghost, 'Duch puszczy').
name(jager, 'Jagerek').
name(harnold, 'Harnaś').
name(komandos, 'Komandos').
name(orzech, 'Orzechówka').
name(smerf, 'Smerf').
name(pepperoni, 'Peperoni pizza').
name(hawaii, 'Hawaii pizza').
name(lays_solone, 'Lajsy solone').
name(lays_papryka, 'Lajsy paprykowe').
name(doritos_ser, 'Serowe doritosy').
name(cheetos_ketchup, 'Czitos keczup').
name(pepsi, 'Pepsi').
name(cola, 'Kokacola').
name(rebull_z_makro, 'Redbull').
name(tiger, 'Tiger').
name(kong_strong, 'Kong strong').
name(vizir, 'Vizir').
name(persil, 'Persil intensive').
name(perwool, 'Perwool').
name(ciasteczka_smiechu, 'Śmieszne ciasteczka').
name(kosmiczny_papierek, 'Papierek niespodzianka').

    % prezenty
name(pusta_puszka, 'Pusta puszka').
name(szalik_legii, 'Szalik Legii').
name(pusta_butelka, 'Pusta butelka').
name(zoladkowa_gorzka, 'Żołądkowa gorzka').
name(sloik, 'Słoik').
name(duzy_czarny_kogut, 'Duży czarny kogut').
name(flaga_lecha, 'Flaga lecha').
name(gaz_pieprzowy, 'Gaz pieprzowy').
name(opaska_do_wlosow, 'Opaska do włosów').
name(czapka_wpierdolka, 'Czapka wpierdolka').
name(bialko, 'Białko').
name(strzykawka_ze_sterydami, 'Strzykawka ze sterydami').
name(zeszyt_od_matmy, 'Zeszyt od matmy').
name(karta_wzorow_na_analize, 'Karta wzorów na analizę').
name(algorytm_genetyczny, 'Algorytm genetyczny').
name(siec_neuronowa, 'Sieć neuronowa').
name(puszka_piwa, 'Puszka piwa').
name(blue_curacao, 'Blue Curacao').
name(puste_piwo_kraftowe, 'Puste piwo kraftowe').
name(tulipan_po_zubrowce, 'Tulipan po Żubrówce').
name(pusta_strzykawka, 'Pusta strzykawka').
name(pelna_strzykawka, 'Pełna strzykawka').
name(zelda_na_nintendo_switch, 'Zelda na Nintendo Switch').
name(rude_wlosy, 'Rude włosy').
name(pelna_puszka, 'Pełna puszka').
name(karty_wzorow_na_amppzty, 'Karty wzorów na AMPPZty').
name(sajgonki_na_fakture, 'Sajgonki na fakturę').
name(mleko_od_starego, 'Mleko od starego').
name(jabol_w_puszce, 'Kabol w puszce').
name(szachy, 'Szachy').
name(baniak_jabola, 'Baniak jabola').
name(cegla, 'Cegła').
name(baseball, 'Baseball').
name(projekt_zespolowy_1, 'Projekt zespołowy 1').
name(projekt_pap, 'Projekt PAP').
name(ptysie, 'Ptysie').
name(projekt_risc_v_na_arko, 'Projekt RISC-V na ARKO').

    % domowka
name(suprise, 'Siatka pełna niespodzianek').
name(szybkie_okularki, 'Szybkie okularki').

% dialog(name, game_state) :- write(), (...).
    % cpuny i kibole
dialog(krzemarz, 1) :- 
    write('Marek: Siema Krzemarz! Dawno cię nie widziałem. Chyba ten system cię oszukał?'), nl,
    write('Krzemarz: Siema Marek! Słuchaj, tak dawno nie prałem moich ubrań proszkiem Perwoll, że już chyba nie wytrzymam. Masz może trochę?'), nl,
    write('Marek: Jasne, żaden problem. 10 złotych i jest twój.'), nl,
    write('Krzemarz: 10 złotych??? Drogo. No ale dobra, biorę. Trzymaj.'), nl,
    add_money(10).

dialog(jacus, 1) :- 
    write('Marek: Cześć Jacuś! Nie masz może ochoty na jakiegoś ptysia?'), nl,
    write('Jacuś: Ty to jednak mnie znasz! Słuchaj, ptysie to tylko w zimie, teraz potrzebny mi proszek Vizir. Mam 15 złotych, uda się coś załatwić?'), nl,
    write('Marek: Spokojnie, damy radę. Trzymaj.'), nl,
    add_money(15).

dialog(sobix, 1) :- 
    write('Marek: Sobix! Jak tam twoja sieć kontaktów? Znasz może kogoś, kto potrzebuje jakiegoś proszku?'), nl,
    write('Sobix: Oj tak. Znam, i jestem to ja. Daj mi trochę, zrobię wszystko, żeby wyprać moją koszulę.'), nl,
    write('Marek: Oczywiście, mogę ci trochę odpalić za 5 złotych. Pasuje ci?'), nl,
    write('Sobix: To wszystko co mam, ale chyba warto. Trzymaj.'), nl,
    add_money(5).

dialog(traba, 1) :- 
    write('Marek: O, Trąba. Ty to pewnie będziesz chciał jakiś konkret?'), nl,
    write('Trąba: A żebyś wiedział. Mam 20 złotych, chcę ten co zwykle, o zapachu lawendy.'), nl,
    write('Marek: Żaden problem, jest twój.'), nl,
    add_money(20).

dialog(krolik, 1) :- 
    write('Marek: Cześć Królik! Nie brakuje ci ostatnio proszku?'), nl,
    write('Królik: Brakuje, brakuje. Bez proszku czuję się jak bez ręki. Masz trochę? Za jakieś 15 złotych?'), nl,
    write('Marek: Oczywiście, że mam. Trzymaj.'), nl,
    add_money(15).

dialog(strozyk, 1) :- 
    write('Stróżyk: Tak naprawdę mogliby Państwo nic ode mnie nie dostać, to nie jest szkoła gdzie pani pisze coś na tablicy a Pan się uczy z zeszytu, wskazuję tematy które będą obowiązywać, jeśli ktoś nawet nie wie jak się oznacza najprostsze rzeczy, to nie moja sprawa, taka osoba ma obowiązek sama opanować ten materiał, to nie jest obowiązkowe a ja nie mam obowiązku niczego udostępniać, więc dobrze by było gdyby Pan pohamował swoje roszczenia, od zawsze było tak że końcowa część materiału nie jest omawiana, ten materiał obowiązuje bo to ma wymagać zaangażowania od Państwa, wszystko już zostało omówione, zestawy zadań też już są, więc może Pan się do tego zabrać tak jak powinno to wyglądać. Btw wyskakuj z portfolio.'), nl,
    write('Marek: Eeeee… no nie wiem, to nie brzmi zbyt dobrze…'), nl,
    remove_money(50).

dialog(witus, 1) :- 
    write('Marek: Siema Wituś! Nie męczą cię te twoje filmiki?'), nl,
    write('Wituś: Jedyne co mnie męczy, to twoja morda. Dawaj hajs i będzie git.'), nl,
    remove_money(30).

dialog(kozuch, 1) :- 
    write('Marek: Cześć Kożuch! Słyszałem, że ostatnio miałeś spore wzmożenie dydaktyczne?'), nl,
    write('Kożuch: Miałem, miałem. A jedyne, czego nie mam, to Perwoll. Daj trochę.'), nl,
    write('Marek: Jasne, chętnie. Ile potrzebujesz?'), nl,
    write('Kożuch: za 30 złotych.'), nl,
    write('Marek: Uuu, sporo. Jest twój.'), nl,
    add_money(30).

dialog(swieczka, 1) :- 
    write('Marek: Świeczka! Prawdopodobnie będziesz chciał trochę Persila?'), nl,
    write('Świeczka: Nie Persila, tylko Perwolla. Daj go za 15 złotych.'), nl,
    write('Marek: Ok, trzymaj.'), nl,
    add_money(15).

dialog(sliwka, 1) :- 
    write('Marek: Śliwka, miło cię widzieć! Słyszałem, że dużo ostatnio chodzisz na ryby?'), nl,
    write('Śliwka: Tak, to prawda. Ostatnio zarzucałem sieci i wpadłem takie bagno, że do tej pory nie doprałem moich spodni. Masz trochę Vizira? Mam przy sobie 20 złotych.'), nl,
    write('Marek: Jasne, powodzenia.'), nl,
    add_money(20).

dialog(krol_julian, 1) :- 
    write('Marek: Król Julian! Podobno tak ci brakuje Persila, że prawie zrobiła ci się papka z mózgu i śnisz na jawie. To prawda?'), nl,
    write('Król Julian: Mrrrrrrr'), nl,
    write('Marek: Tak myślałem, powalona Idea. Trzymaj proszek, tylko odpal mi z 10 złotych.'), nl,
    add_money(10).

dialog(duzy_eryk, 1) :- 
    write('Duży Eryk: Słyszałem, że ostatnio wymieniałeś okna na coś lepszego debilu? Dawaj hajs.'), nl,
    remove_money(40).

dialog(bialy_crook, 1) :- 
    write('Marek: Siema Crooku! Potrzebujesz czegoś?'), nl,
    write('Biały Crook: Tak, przydałoby się trochę Persila, będziesz miał za 50 złotych?'), nl,
    write('Marek: Jasne, trzymaj. W końcu odpowiadasz za bezpieczeństwo całego systemu.'), nl,
    add_money(50).

dialog(chudy, 1) :- 
    write('Marek: Ale nudy, szkoda mi czasu.'), nl,
    write('Chudy: Nie, zaczekaj! Zapłacę ci.'), nl,
    write('Marek: 25 złotych?'), nl,
    write('Chudy: Może być.'), nl,
    add_money(25).

dialog(jeziorak, 1) :- 
    write('Marek: Cześć Jeziorak! Słyszałem, że ostatnio byłeś w Azji?'), nl,
    write('Jeziorak: Tak, cieszę się, że mnie wołałeś. Potrzebny mi cały stos Vizira.'), nl,
    write('Marek: Jasne, mogę ci dać, za 20 złotych.'), nl,
    write('Jeziorak: Chwila, chwila. Pan mnie nie oszukuje? A nie, wszystko w porządku.'), nl,
    add_money(20).

dialog(niespodzianka, 1) :- 
    write('Niespodzianka: Niespodzianka! Wyskakuj z hajsu leszczu.'), nl,
    remove_money(50).

dialog(charkacz, 1) :- 
    write('Marek: Hej!'), nl,
    write('Charkacz: ...'), nl, 
    write('Marek: Aha. Chcesz może Perwoll?'), nl,
    write('Charkacz: Tak. 10zł.'), nl,
    add_money(10).

dialog(mariusz, 1) :- 
    write('Marek: Cześć! Potrzebujesz czegoś?'), nl,
    write('Mariusz: Tak, chciałbym zmarnować ci trochę czasu.'), nl,
    write('Marek: No nie wiem, a chcesz może Persil?'), nl,
    write('Mariusz: Ty to wiesz, jak przekonać człowieka. Trzymaj 15zł.'), nl,
    add_money(15).

dialog(grabie, 1) :- 
    write('Marek: Siema Grabie! Widzę, że znowu bierzesz się za wszystko jednocześnie?'), nl,
    write('Grabie: Tak, czemu nie. Ale potrzebny mi będzie Vizir. Masz trochę?'), nl,
    write('Marek: Jasne, trzymaj za 15zł.'), nl,
    add_money(15).

dialog(gracjan, 1) :- 
    write('Marek: Gracjan! Czemu znowu masz przy sobie identyfikator ze swojej pracy?'), nl,
    write('Gracjan: Żebyś nie zauważył, jak zabrałem ci 50 złotych.'), nl, 
    remove_money(50).

    % studenci
dialog(karol_wietnam, 3) :- 
    write('Marek: Siema Karol! Wbijasz na domówkę czy wolisz cisnąć AMPPZty?'), nl,
    write('Karol z Wietnamu: Wiesz co, wolałbym pić piwo i jeść pizzę na fakturę. Ale i tak przyjdę!'), nl,
    write('Marek: Super. W takim razie sobota wieczorem, znasz adres.'), nl.

dialog(martynka, 3) :- 
    write('Marek: Martynka! Chcesz przyjść na domówkę?'), nl,
    write('Martynka: Tak, ale chcę cały czas kuć do kolosa z SOI na za tydzień i jeść pizzę hawajską.'), nl,
    write('Marek: No dobra, tylko nie zapomnij czegoś ze sobą zabrać.'), nl.

dialog(kopytek, 3) :- 
    write('Marek: Siema Kopytek! Nie chcesz może wbić na domóweczkę w ten weekend?'), nl,
    write('Kopytek: No nie wiem, nie wiem. A będę mógł tam obejrzeć anime i się pouczyć?'), nl,
    write('Marek: Tak, tak, będziesz mógł. Zabierz tylko coś do picia.'), nl.

dialog(piotrek, 3) :- 
    write('Marek: Piotrek, przychodzisz na domówkę? Będzie jeszcze lepsza niż ostatni meczyk u ciebie.'), nl,
    write('Piotrek: A wiesz co, czemu nie. I tak nie mam nic do roboty.'), nl,
    write('Marek: Najs.'), nl.

dialog(bartek, 3) :- 
    write('Marek: Wbijasz w weekend na domóweczkę? Może nawet kupię ci piwo kraftowe.'), nl,
    write('Bartek: Ty to wiesz jak mnie przekonać. Pewnie, że będę.'), nl.

dialog(jureczek, 3) :- 
    write('Marek: Siema Jureczek! Dawaj na domówkę w ten weekend.'), nl,
    write('Jureczek: Spoko, czemu nie.'), nl.

dialog(tomek, 3) :- 
    write('Marek: Tomek! Chcesz przyjść na domówkę w weekend?'), nl,
    write('Tomek: Jasne, chętnie. Zabiorę coś ze sobą.'), nl.

dialog(wojtek, 3) :- 
    write('Marek: Wojtek, chcesz wbić na domówkę?'), nl,
    write('Wojtek: Jasne, czemu nie, wezmę ze sobą papierek i ciasteczka. Kiedy ma być?'), nl,
    write('Marek: W sobotę wieczorem, u mnie.'), nl,
    write('Wojtek: Idealnie! W takim razie w sobotę się widzimy.'), nl.

dialog(macius, 3) :- 
    write('Maciuś: Ty, a to ostatnie zadanie to nie było na preprocessing?'), nl,
    write('Marek: Maciuś, masz rację. Piszesz kod i wbijaj na domówkę.'), nl,
    write('Maciuś: No dobra, to może nawet coś ze sobą wezmę, na przykład FFT. Ale i tak będziemy robić zadanka. A btw, myślałeś o pracy w Visie?'), nl.

dialog(olek, 3) :- 
    write('Marek: Chcesz przyjść na domówkę?'), nl,
    write('Olek: A chcesz pogadać o drzewach przedziałowych?'), nl,
    write('Marek: Eee… wiesz co, może kiedy indziej.'), nl,
    write('Olek: Szkoda. Ale na domówkę i tak przyjdę.'), nl.

dialog(kubus, 3) :- 
    write('Marek: Siema Kubuś, wbijasz na domóweczkę w sobotę wieczorem?'), nl,
    write('Kubuś: Mogę wbić, tylko dokończę pisać projekt z prologa na PARP. Ale 1. Będzie tam jager, 2. Nie idę spać przez ostatnie 3 dni. Pasuje ci to?'), nl,
    write('Marek: Git. To widzimy się w sobotę.'), nl.

dialog(rafalek, 3) :- 
    write('Marek: Wbijasz na domówkę?'), nl,
    write('Rafałek: Kurde, wbiłbym, ale trzeba zrobić jakąś kampanię marketingową.'), nl,
    write('Marek: Dobra, klienci mogą zaczekać, zrobisz kampanię dla domówki. Robimy chlanie.'), nl,
    write('Rafałek: No dobra. To zabieram jakieś dobre picie i odpalamy domóweczkę.'), nl.

dialog(lukasz_2, 3) :- 
    write('Marek: Siema Łukasz? Mówił ci ktoś, że wyglądasz jak Łukasz i tak samo się nazywasz?'), nl,
    write('Łukasz: Dobra, we. O co chodzi?'), nl,
    write('Marek: Wbijasz na domówkę w sobotę wieczorem?'), nl,
    write('Łukasz: Jasne. To wezmę ze sobą jakieś 0.5.'), nl.

dialog(krzysiu, 3) :- 
    write('Marek: Wbijasz na domówkę zachlać mordę?'), nl,
    write('Krzysiu: Uuuuu, już to zoeobłem. Ale jaks ccheszsz , to smo żemy to powtózyć. Mogę znowu kręcić driny.'), nl,
    write('Marek: Git. W takim razie widzimy się w sobotę.'), nl.

dialog(mikolaj, 3) :- 
    write('Marek: Dawaj na domóweczkę, napijesz się i będziesz robił pompki.'), nl,
    write('Mikołaj: No dobra, ale pamiętaj, że ja nie piję. Masa sama się nie zrobi na siłce.'), nl,
    write('Marek: Spoko, jasne, damy radę.'), nl.

dialog(jasiulek, 3) :- 
    write('Marek: Jasiulek, dawaj chlanie u mnie w sobotę.'), nl,
    write('Jasiulek: Kuuurde, oczywiście, że tak. Wbijam, ale będziecie mnie holować do domu.'), nl.

dialog(mati, 3) :- 
    write('Marek: Mati, wbijasz na domóweczkę. Tylko tym razem pamiętaj, że masz dziewczynę xD.'), nl,
    write('Mati: Aha, bardzo zabawne. Wbijam, tym razem postaram się przeżyć do końca.'), nl.

dialog(wiktor, 3) :- 
    write('Marek: Siema Wiktor, wbijaj na domóweczkę.'), nl,
    write('Wiktor: Spoko, chętnie wbiję.'), nl,
    write('Marek: Giiit. Tylko tym razem coś wypij xD.'), nl,
    write('Wiktor: Jasne, tym razem nie przyjadę samochodem xD.'), nl.

dialog(adrian, 4) :- 
    write('Marek: Adrian! Myślałem, że przyjechałeś TTką, czemu leżysz nad kiblem.'), nl,
    write('Adrian: Blebuegrrbłłl.'), nl.

dialog(rafalek, 4) :- 
    write('Rafał: Nie przeszkadzaj, Martynka tak dobrze całuje'), nl.

dialog(martynka, 4) :- 
    write('Martynka: Ale Rafał jest przystojny…'), nl.

dialog(_, 4) :- 
    write('Marek: I jak się bawisz? Warto było wbić na domóweczkę?'), nl,
    write('Jest zajebiście!'), nl.


dialog(babcia, 1) :-
    write('Spierdal zjebie!'), nl.

/* spawn npc na imprezie */
spawn_npcs(Quality, GuestList) :-
    Quality > 1,
    spawn_better_loop(GuestList).

spawn_npcs(_, GuestList) :-
    spawn_worse_loop(GuestList).

spawn_better_loop([]).
spawn_better_loop([Guest | Tail]) :-
    assert(npc(Guest, parkiet)),
    prezent(Guest, Expected, _, _),
    spawn_better_npc(Guest, Expected),
    spawn_better_loop(Tail).

spawn_better_npc(NpcName, Expected) :-
    check_if_has_item(Expected),
    add_better_item(NpcName, Expected).

spawn_better_npc(NpcName, Expected) :-
    add_worse_item(NpcName, Expected).

add_better_item(NpcName, Expected) :-
    prezent(NpcName, Expected, _, Item),
    add_item(Item).

spawn_worse_loop([]).
spawn_worse_loop([Guest | Tail]) :-
    assert(npc(Guest, parkiet)),
    prezent(Guest, Expected, _, _),
    spawn_worse_npc(Guest, Expected),
    spawn_worse_loop(Tail).

spawn_worse_npc(NpcName, Expected) :-
    check_if_has_item(Expected),
    add_worse_item(NpcName, Expected).

spawn_worse_npc(_, _).


add_worse_item(NpcName, Expected) :-
    prezent(NpcName, Expected, Item, _),
    add_item(Item).

check_if_has_item(ExpectedItem) :-
    party_inventory(Items),
    check_if_has_item_loop(ExpectedItem, Items).

check_if_has_item_loop(X, [X|_]).
check_if_has_item_loop(X, [_|T]) :-
    check_if_has_item_loop(X, T).


/* Mechanika poruszania się */
% go_to_map(map_name) :- all thing to move beetwen maps
go_to_map(pokoj_babci) :-
    retract(player_location(pokoj_marka)),
    assert(player_location(pokoj_babci)),
    retract(game_state(0)),
    assert(game_state(1)),
    describe_location(pokoj_babci).

go_to_map(targowek) :-
    retract(player_location(pokoj_marka)),
    assert(player_location(blokowa)),
    retract(game_state(0)),
    assert(game_state(1)),
    describe_location(blokowa).

go_to_map(makro) :-
    player_location(CurrentLocation),
    retract(player_location(CurrentLocation)),
    assert(player_location(alejka_alkohol)),
    retract(game_state(1)),
    assert(game_state(2)),
    describe_location(alejka_alkohol).

go_to_map(wydzial) :-
    retract(player_location(palarnia_smietnik)),
    assert(player_location(korytarz_1_pietro)),
    retract(game_state(2)),
    assert(game_state(3)),
    describe_location(korytarz_1_pietro).

go_to_map(domowka) :-
    retract(player_location(korytarz_1_pietro)),
    assert(player_location(parkiet)),
    retract(game_state(3)),
    assert(game_state(4)),
    describe_location(parkiet),
    guests_count(GuestsCount),
    party_quality(SumedQuality),
    Quality is SumedQuality/GuestsCount,
    guest_list(GuestList),
    spawn_npcs(Quality, GuestList).

go_to_map(drzwi_wejsciowe) :-
    retract(player_location(parkiet)),
    assert(player_location(drzwi_wejsciowe)),
    retract(game_state(4)),
    assert(game_state(5)),
    init_fight.

% move beetwen maps
move(Direction) :-
    player_location(CurrentLocation),
    connection(CurrentLocation, NextLocation, Direction),
    map(NextLocation),
    go_to_map(NextLocation).

% just normal places
move(Direction) :-
    player_location(CurrentLocation),
    connection(CurrentLocation, NextLocation, Direction),
    retract(player_location(CurrentLocation)),
    assert(player_location(NextLocation)),
    describe_location(NextLocation).

move(_) :-
    write('Nie możesz tam przejść.'), nl.

north :- move(north).
east :- move(east).
south :- move(south).
west :- move(west).

/* Funkcja wyświetlająca możliwe przejścia z aktualnej lokalizacji */
display_possible_moves(CurrentLocation) :-
    findall(Direction-NextLocation, connection(CurrentLocation, NextLocation, Direction), Moves),
    (Moves = [] ->
        write('Nie ma dostępnych przejść.'), nl;
        write('Możliwe przejścia:'), nl,
        print_moves(Moves)
    ).

display_items(CurrentLocation) :-
    findall(Item, positioned_item(Item, CurrentLocation), Items),
    (Items = [] ->
        write('Nie ma tu nic do podniesienia.'), nl;
        write('Itemy:'), nl,
        print_loop(Items)
    ).

display_npcs(CurrentLocation) :-
    findall(Name, npc(Name, CurrentLocation), Names),
    (Names = [] ->
        write('Nie ma tu nikogo.'), nl;
        write('Osoby:'), nl,
        print_loop(Names)
    ).

print_moves([]).
print_moves([Direction-NextLocation | Tail]) :-
    write(Direction), write(' -> '), write(NextLocation), nl,
    print_moves(Tail).

print_loop([]).
print_loop([Item | Tail]) :-
    description(Item),
    print_loop(Tail).

describe_location(Location) :-
    location(Location),
    write('Znajdujesz się w: '), description(Location), nl,
    display_possible_moves(Location), nl,
    display_items(Location), nl,
    display_npcs(Location).

/* Mechanika podnoszenia przedmiotów */
pick_up(ItemName) :-
    player_location(Location),
    positioned_item(ItemName, Location),
    add_item(ItemName),
    retract(positioned_item(ItemName, Location)).

% not defined
pick_up(_) :-
    write('Nie ma tu takiego przedmiotu.'), nl.

% money item
add_item(ItemName) :-
    money_item(ItemName, Price),
    add_money(Price).

% party item < 0
add_item(ItemName) :-
    party_item(ItemName, Price, _),
    player_money(CurrentMoney),
    NewMoney is CurrentMoney - Price,
    NewMoney < 0,
    write('Przedmiot jest za drogi'), nl,
    write('Zostało Ci '), write(CurrentMoney), write(' zł.'), nl.

% party item >= 0
add_item(ItemName) :-
    party_item(ItemName, Price, Quality),
    player_money(CurrentMoney),
    NewMoney is CurrentMoney - Price,
    NewMoney >= 0,
    retract(player_money(CurrentMoney)),
    assert(player_money(NewMoney)),
    party_inventory(Items),
    retract(party_inventory(Items)),
    assert(party_inventory([ItemName|Items])),
    party_quality(CurrentQuality),
    retract(party_quality(CurrentQuality)),
    NewQuality is CurrentQuality + Quality,
    assert(party_quality(NewQuality)),
    write('Wydałeś '), write(Price), write(' zł.'), nl,
    write('Zostało Ci '), write(NewMoney), write(' zł.'), nl.

% fight item
add_item(ItemName) :-
    fight_item(ItemName, _, __),
    player_inventory(Inventory),
    retract(player_inventory(Inventory)),
    assert(player_inventory([ItemName|Inventory])),
    write('Dodano przedmiot '), description(ItemName), nl.

% not defined
add_item(_) :-
    write('Error').

add_money(Amount) :- 
    player_money(CurrentMoney),
    NewMoney is CurrentMoney + Amount,
    retract(player_money(CurrentMoney)),
    assert(player_money(NewMoney)),
    write('Otrzymałeś '), write(Amount), write(' zł.'), nl.

remove_money(Amount) :- 
    player_money(CurrentMoney),
    NewMoney is CurrentMoney - Amount,
    NewMoney < 0,
    NewMoney is 0,
    retract(player_money(CurrentMoney)),
    assert(player_money(NewMoney)).

remove_money(Amount) :- 
    player_money(CurrentMoney),
    NewMoney is CurrentMoney - Amount,
    NewMoney >= 0,
    retract(player_money(CurrentMoney)),
    assert(player_money(NewMoney)).

/* Mechanika rozmowy z NPC */
talk_to(NPCName) :-
    game_state(3),
    player_location(Location),
    npc(NPCName, Location),
    retract(npc(NPCName, Location)),
    invite(NPCName),
    dialog(NPCName, 3).

talk_to(NPCName) :-
    player_location(Location),
    npc(NPCName, Location),
    game_state(State),
    retract(npc(NPCName, Location)),
    dialog(NPCName, State).

talk_to(_) :-
    write('Nie ma tu takiej osoby.'), nl.

/* Mechanika walki */
init_fight :-
    player_inventory(Inventory),
    fight_loop(100, 100, Inventory).

fight_loop(PlayerHP, _, _) :-
    PlayerHP =< 0,
    write('Przegrałeś walkę.'), nl.

fight_loop(_, EnemyHP, _) :-
    EnemyHP =< 0,
    write('Wygrałeś walkę!'), nl.

fight_loop(PlayerHP, EnemyHP, Inventory) :-
    write('Twoje HP: '), write(PlayerHP), nl,
    write('HP Andżeja: '), write(EnemyHP), nl,
    write('Twoje przedmioty: '), write(Inventory), nl,
    write('Wybierz przedmiot do użycia: '), nl,
    read(ItemName),
    use_item(ItemName, Damage, Heal),
    NewEnemyHP is EnemyHP - Damage,
    NewPlayerHP is PlayerHP + Heal,
    enemy_attack(NewPlayerHP, FinalPlayerHP),
    fight_loop(FinalPlayerHP, NewEnemyHP, Inventory).

use_item(ItemName, Damage, Heal) :-
    player_inventory(Inventory),
    member(ItemName, Inventory),
    fight_item(ItemName, Heal, Damage),
    write('Użyłeś '), write(ItemName), nl.

use_item(_, _, _) :-
    write('Nie możesz użyć tego przedmiotu.'), nl.

enemy_attack(PlayerHP, NewPlayerHP) :-
    Damage is 10,
    NewPlayerHP is PlayerHP - Damage,
    write('Andżej atakuje i zadaje '), write(Damage), write(' obrażeń.'), nl.

/* Mechanika zapraszania gości */
invite(rafalek) :-
    guest_list(Guests),
    retract(guest_list(Guests)),
    assert(guest_list([Guests|rafalek])),
    guest_list(Guests2),
    retract(guest_list(Guests2)),
    assert(guest_list([Guests2|martynka])),
    retract(npc(martynka, sala_wykladowa)),
    guests_count(CurrentCount),
    NewCount is CurrentCount + 2,
    retract(guests_count(CurrentCount)),
    assert(guests_count(NewCount)).

invite(martynka) :-
    guest_list(Guests),
    retract(guest_list(Guests)),
    assert(guest_list([Guests|rafalek])),
    guest_list(Guests2),
    retract(guest_list(Guests2)),
    assert(guest_list([Guests2|martynka])),
    retract(npc(rafalek, laboratorium_sieciowe)),
    guests_count(CurrentCount),
    NewCount is CurrentCount + 2,
    retract(guests_count(CurrentCount)),
    assert(guests_count(NewCount)).

invite(GuestName) :-
    guest_list(Guests),
    retract(guest_list(Guests)),
    assert(guest_list([Guests|GuestName])),
    guests_count(CurrentCount),
    NewCount is CurrentCount + 1,
    retract(guests_count(CurrentCount)),
    assert(guests_count(NewCount)).

/* Uruchomienie gry */
start :-
    player_location(pokoj_marka),
    write('Witaj w grze "Targówka na Domówku 2: Powrót Andżeja"!'), nl,
    write('Twoim celem jest zorganizowanie epickiej domówki.'), nl,
    write('Możesz używać komend: north, east, south, west, describe, pick \'Przedmiot\', talk \'Imię\''), nl,
    describe_location(pokoj_marka).

start.

describe :- 
    player_location(Location),
    describe_location(Location).

:- op(200, fx, talk). % Define 'talk' as a prefix operator
:- op(200, fx, pick). % Define 'pick' as a prefix operator

talk NPCName :- 
    atom(NPCName), % Ensure NPCName is an atom
    name(VarName, NPCName),
    talk_to(VarName). % Call the talk_to/1 predicate

pick Name :- 
    atom(Name), % Ensure NPCName is an atom
    name(VarName, Name),
    pick_up(VarName). % Call the talk_to/1 predicate
