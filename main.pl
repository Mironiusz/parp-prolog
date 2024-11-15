% Definicja dynamicznych predykatów, które będą modyfikowane w trakcie gry
:- dynamic(player_location/1).
:- dynamic(player_inventory/1).
:- dynamic(party_inventory/1).
:- dynamic(player_money/1).

:- dynamic(npc/4).
:- dynamic(location/3).
:- dynamic(connection/3).
:- dynamic(guest/3).
:- dynamic(guests/1).
:- dynamic(game_state/1).

% Początkowa lokalizacja gracza
player_location(pokoj_marka).

% Początkowy stan inwentarza gracza
player_inventory([]).
party_inventory([]).

guests([]).

% Początkowa ilość pieniędzy gracza
player_money(0).
game_state(0).
/* Definicja lokalizacji */
% map(Nazwa)

map(dom_marka).
map(targowek).
map(makro).
map(wydzial).

% location(Nazwa, Opis, Lista_przedmiotów)
% location(Nazwa).

% Lokacja startowa: Pokój Marka
location(pokoj_marka).

% Pokój Babci
location(pokoj_babci, [skarpetka, lupa, stare_zdjecie]).

% Dom Marka - główne miejsce domówki
location(dom_marka, 'Dom Marka', [mega_sejf, mapa_targowka]).

% Dom Marka - szczegóły podczas domówki
location(epicka_lazienka, 'Epicka Łazienka', [siatka_pelna_niespodzianek]).
location(parkiet, 'Parkiet na domówce', []).
location(drzwi_wejsciowe, 'Drzwi wejściowe', []).

% Targówek i okoliczne ulice
location(targowek, 'Targówek', []).
location(jorskiego, 'Ulica Jórskiego', [szlugi, pusta_puszka_kuflowe_mocne, metalowy_pret, cegla]).
location(radzyminska, 'Ulica Radzymińska', [klucz_francuski, kastet, kebab, smieci]).
location(blokowa, 'Ulica Blokowa', [baseball, tulipan_po_krolewskim, piwo, doritosy]).
location(ogrodnicza, 'Ulica Ogrodnicza', [energol, strzykawka, gazeta, malpka_z_zabki]).
location(spot_sprzedazy_proszku, 'Spot do sprzedaży proszku', [proszek_do_prania_vizir]).

% Sklep Makro i jego alejki
location(makro, 'Makro - Główne Wejście', []).
location(alejka_alkohol, 'Alejka z alkoholem', [zubrowka, duch_puszczy, jager, harnas, komandos, orzechowka, smerf]).
location(alejka_jedzenie, 'Alejka z jedzeniem', [pizza_pepperoni, pizza_hawajska, laysy_solone, laysy_paprykowe, doritosy_serowe, cheetosy_ketchup]).
location(alejka_napoje, 'Alejka z napojami', [pepsi, cola, red_bull, tiger, kong_strong]).
location(palarnia_smietnik, 'Palarnia przy śmietniku', [proszek_do_prania_vizir, proszek_do_prania_persil, proszek_do_prania_perwoll, smieszne_ciasteczka, papierki]).

% Wydział i jego pomieszczenia
location(wydzial, 'Wydział', []).
location(pietro_16, '16. piętro na wydziale', []).
location(piwnica, 'Piwnica wydziału', []).
location(piwnica_piwnicy, 'Piwnica piwnicy', []).
location(sala_wykladowa, 'Sala wykładowa', []).
location(korytarz_1_pietro, 'Korytarz na 1. piętrze', []).
location(meski_kibel, 'Męski kibel', []).
location(damski_kibel, 'Damski kibel - zamurowany, nie można wejść', []).

% Specjalne miejsca na wydziale
location(wietnam, 'Wietnam', []).
location(laboratorium_komputerowe, 'Laboratorium komputerowe', []).
location(laboratorium_sieciowe, 'Laboratorium sieciowe', []).

% Domówka - kluczowe miejsca
location(domowka, 'Dom Marka - Domówka', [szybkie_okularki]).


/* Definicja połączeń między lokalizacjami */
% connection(Z_lokalizacji, Do_lokalizacji, Kierunek)

% Połączenia z Pokojem Marka
connection(pokoj_marka, pokoj_babci, east).
connection(pokoj_marka, targowek, south).

connection(pokoj_babci, pokoj_marka, west).

% Połączenia na Targówku
connection(targowek, blokowa, west).

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
connection(makro, alejka_alkohol, east).
connection(makro, alejka_jedzenie, west).
connection(makro, alejka_napoje, south).
connection(makro, palarnia_smietnik, north).

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
connection(wydzial, korytarz_1_pietro, west).

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
connection(korytarz_1_pietro, dom_marka, south). % Tutaj idziemy do domu Marka

% Połączenia w Domu Marka
connection(dom_marka, epicka_lazienka, west).
connection(dom_marka, parkiet, south).
connection(dom_marka, drzwi_wejsciowe, north).

connection(epicka_lazienka, dom_marka, east).
connection(parkiet, dom_marka, north).
connection(parkiet, drzwi_wejsciowe, south).


/* Definicja przedmiotów */
% positioned_item(Nazwa, Location).
% pokoj marka
positioned_item(oszczednosci, pokoj_marka).
positioned_item(giga_okularki, pokoj_marka).
positioned_item(koszulka_z_amppz, pokoj_marka).
item(koszulka_z_amppz, przedmiot_specjalny, 'Koszulka z AMPPZ', [def(2)], 0).

% pokoj babci

% targowek

% macro
positioned_item(zubrowka, alejka_alkohol).
positioned_item(pizza_pepperoni, alejka_jedzenie).
positioned_item(red_bull, alejka_napoje).

% fight_item(name, healing_effect, damage_effect).
fight_item(giga_okularki, 0, 5).

% money_item(name, price).
money_item(oszczednosci, 100).


% party_item(name, price, quality).
party_item(zubrowka, 20, 5).
party_item(pizza_pepperoni, 15, 7).
party_item(red_bull, 5, 3).

/* Definicja postaci NPC */
% npc(Nazwa, Lokalizacja, Dialogi, Przedmioty_do_otrzymania)
npc(babcia, pokoj_babci).
npc(andrzej, drzwi_wejsciowe).

/* dialog(NPC, location, Dialog). */

/* Definicja gości */
% guest(Nazwa, Oczekiwany_przedmiot, Poziom_zadowolenia)
guest(rafal, komandos, 0).
guest(kubus, jager, 0).
guest(macius, red_bull, 0).


/* guest(NPC, weak, strong). */

/* prezent(name, healing_effect, damage_effect). */



/* descriptions and dialogs */

% description(name) :- write(), (...).
description(pokoj_marka) :- write('Pokój Marka'), nl.
description(pokoj_babci) :- write('Pokój babci'), nl.
description(targowek) :- write('Targówke'), nl.

description(oszczednosci) :- write('Oszczędności'), nl.
description(giga_okularki) :- write('Giga okularki'), nl.
description(koszulka_z_amppz) :- write('Koszulka z AMPPZ'), nl.
description(zubrowka) :- write('Żubrówka'), nl.
description(pizza_pepperoni) :- write('Pizza Pepperoni'), nl.
description(red_bull) :- write('Red Bull'), nl.

% dialog(name, game_state) :- write(), (...).

/* Mechanika poruszania się */
% go_to_map(map_name) :- all thing to move beetwen maps
go_to_map(Map). % TODO: fill with existing maps

% move beetwen maps
move(Direction) :-
    player_location(CurrentLocation),
    connection(CurrentLocation, NextLocation, Direction),
    map(NextLocation),
    go_to_map(NextLocation),
    player_location(Location),
    describe_location(Location).

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

print_moves([]).
print_moves([Direction-NextLocation | Tail]) :-
    write(Direction), write(' -> '), write(NextLocation), nl,
    print_moves(Tail).

describe_location(Location) :-
    location(Location, Description, Items),
    write('Znajdujesz się w: '), write(Description), nl,
    game_state(State), write(State), nl,
    display_possible_moves(Location),
    (Items \= [] ->
        write('Widzisz tutaj: '), write(Items), nl;
        true).

/* Mechanika podnoszenia przedmiotów */
pick(ItemName) :-
    player_location(Location),
    positioned_item(ItemName, Location),
    add_item(ItemName),
    retract(positioned_item(ItemName, Location)).

% not defined
pick(_) :-
    write('Nie ma tu takiego przedmiotu.'), nl.

% money item
add_item(ItemName) :-
    money_item(ItemName, Price),
    add_money(Price).

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
    write('Wydałeś '), write(Amount), write(' zł.'), nl,
    write('Zodstało Ci '), write(NewMoney), write(' zł.'), nl.

% party item < 0
add_item(ItemName) :-
    party_item(ItemName, Price, Quality),
    player_money(CurrentMoney),
    NewMoney is CurrentMoney - Price,
    NewMoney < 0,
    write('Przedmiot jest za drogi'), nl,
    write('Zodstało Ci '), write(NewMoney), write(' zł.'), nl.

% fight item
add_item(ItemName) :-
    fight_item(ItemName, _, __),
    player_inventory(Inventory),
    retract(player_inventory(Inventory)),
    assert(player_inventory([ItemName|Inventory])),
    write('Dodano przedmiot '), write(description(ItemName)), nl.

% not defined
add_item(_) :-
    write('Error').

add_money(Amount) :- 
    player_money(CurrentMoney),
    NewMoney is CurrentMoney + Amount,
    retract(player_money(CurrentMoney)),
    assert(player_money(NewMoney)),
    write('Otrzymałeś '), write(Amount), write(' zł.'), nl.

/* Mechanika rozmowy z NPC */
talk_to(NPCName) :-
    player_location(Location),
    npc(NPCName, Location, Dialogues, Rewards).

talk_to(_) :-
    write('Nie ma tu takiej osoby.'), nl.

print_dialogues([]).
print_dialogues([H|T]) :-
    write('"'), write(H), write('"'), nl,
    print_dialogues(T).

/* Mechanika walki */
fight :-
    player_location(drzwi_wejsciowe),
    npc(andrzej, drzwi_wejsciowe),
    write('Rozpoczynasz walkę z Andżejem!'), nl,
    init_fight.

fight :-
    write('Nie ma tu nikogo do walki.'), nl.

init_fight :-
    player_inventory(Inventory),
    fight_loop(100, 100, Inventory).

fight_loop(PlayerHP, EnemyHP, _) :-
    PlayerHP =< 0,
    write('Przegrałeś walkę.'), nl.

fight_loop(PlayerHP, EnemyHP, _) :-
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

use_item(_, 0, 0) :-
    write('Nie możesz użyć tego przedmiotu.'), nl.

enemy_attack(PlayerHP, NewPlayerHP) :-
    Damage is 10,
    NewPlayerHP is PlayerHP - Damage,
    write('Andżej atakuje i zadaje '), write(Damage), write(' obrażeń.'), nl.

/* Mechanika zapraszania gości */
invite(GuestName) :-
    player_location(wydzial),
    guest(GuestName, ExpectedItem, _),
    write('Zapraszasz '), write(GuestName), write(' na domówkę.'), nl,
    check_expectations(GuestName, ExpectedItem).

invite(_) :-
    write('Nie ma takiej osoby do zaproszenia.'), nl.

check_expectations(GuestName, ExpectedItem) :-
    player_inventory(Inventory),
    (member(ExpectedItem, Inventory) ->
        Satisfaction = 2;
        Satisfaction = 1),
    retract(guest(GuestName, ExpectedItem, _)),
    assert(guest(GuestName, ExpectedItem, Satisfaction)),
    write(GuestName), write(' będzie na imprezie.'), nl.

/* Uruchomienie gry */
start :-
    write('Witaj w grze "Targówka na Domówku 2: Powrót Andżeja"!'), nl,
    write('Twoim celem jest zorganizowanie epickiej domówki.'), nl,
    write('Możesz używać komend: move(Direction), pick(Item), talk_to(NPC), shop, fight, invite(Guest).'), nl,
    describe_location(pokoj_marka).
