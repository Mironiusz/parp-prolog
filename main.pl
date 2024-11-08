% Definicja dynamicznych predykatów, które będą modyfikowane w trakcie gry
:- dynamic(player_location/1).
:- dynamic(player_inventory/1).
:- dynamic(player_money/1).
:- dynamic(npc/4).
:- dynamic(item/5).
:- dynamic(location/3).
:- dynamic(connection/3).
:- dynamic(guest/3).

% Początkowa lokalizacja gracza
player_location(pokoj_marka).

% Początkowy stan inwentarza gracza
player_inventory([]).

% Początkowa ilość pieniędzy gracza
player_money(0).

/* Definicja lokalizacji */
% location(Nazwa, Opis, Lista_przedmiotów)
location(pokoj_marka, 'Pokój Marka', [oszczednosci, giga_okularki, koszulka_z_amppz]).
location(pokoj_babci, 'Pokój Babci', [skarpetka, lupa, stare_zdjecie]).
location(dom_marka, 'Dom Marka', []).
location(targowek, 'Targówek', [mega_sejf]).
location(makro, 'Makro', []).
location(wydzial, 'Wydział', []).

/* Definicja połączeń między lokalizacjami */
% connection(Z_lokalizacji, Do_lokalizacji, Kierunek)
connection(pokoj_marka, pokoj_babci, east).
connection(pokoj_marka, dom_marka, south).
connection(dom_marka, pokoj_marka, north).
connection(dom_marka, pokoj_babci, east).
connection(dom_marka, targowek, west).
connection(targowek, dom_marka, east).
connection(dom_marka, makro, south).
connection(makro, dom_marka, north).
connection(dom_marka, wydzial, east).
connection(wydzial, dom_marka, west).

/* Definicja przedmiotów */
% item(Nazwa, Kategoria, Opis, Właściwości, Cena)
item(oszczednosci, pieniadze, 'Twoje oszczędności', [wartosc(100)], 0).
item(giga_okularki, przedmiot_specjalny, 'Giga okularki', [dmg(5)], 0).
item(koszulka_z_amppz, przedmiot_specjalny, 'Koszulka z AMPPZ', [def(2)], 0).

% Przykładowe przedmioty z Makro
item(zubrowka, alkohol, 'Żubrówka', [zadowolenie(5)], 20).
item(pizza_pepperoni, jedzenie, 'Pizza Pepperoni', [zadowolenie(7)], 15).
item(red_bull, napoj, 'Red Bull', [zadowolenie(3)], 5).

/* Definicja postaci NPC */
% npc(Nazwa, Lokalizacja, Dialogi, Przedmioty_do_otrzymania)
npc(babcia, pokoj_babci, ['Co tam, wnuczku?'], [pieniadze(50)]).
npc(andrzej, drzwi_wejsciowe, ['Nie zaprosiłeś mnie na imprezę?'], []).

/* Definicja gości */
% guest(Nazwa, Oczekiwany_przedmiot, Poziom_zadowolenia)
guest(rafal, komandos, 0).
guest(kubus, jager, 0).
guest(macius, red_bull, 0).

/* Mechanika poruszania się */
move(Direction) :-
    player_location(CurrentLocation),
    connection(CurrentLocation, NextLocation, Direction),
    retract(player_location(CurrentLocation)),
    assert(player_location(NextLocation)),
    describe_location(NextLocation).

move(_) :-
    write('Nie możesz tam przejść.'), nl.

describe_location(Location) :-
    location(Location, Description, Items),
    write('Znajdujesz się w: '), write(Description), nl,
    (Items \= [] ->
        write('Widzisz tutaj: '), write(Items), nl;
        true).

/* Mechanika podnoszenia przedmiotów */
pick(ItemName) :-
    player_location(Location),
    location(Location, _, Items),
    member(ItemName, Items),
    retract(location(Location, Desc, Items)),
    delete(Items, ItemName, NewItems),
    assert(location(Location, Desc, NewItems)),
    player_inventory(Inventory),
    retract(player_inventory(Inventory)),
    assert(player_inventory([ItemName|Inventory])),
    write('Podniosłeś: '), write(ItemName), nl.

pick(_) :-
    write('Nie ma tu takiego przedmiotu.'), nl.

/* Mechanika rozmowy z NPC */
talk_to(NPCName) :-
    player_location(Location),
    npc(NPCName, Location, Dialogues, Rewards),
    write(NPCName), write(' mówi: '), nl,
    print_dialogues(Dialogues),
    give_rewards(Rewards).

talk_to(_) :-
    write('Nie ma tu takiej osoby.'), nl.

print_dialogues([]).
print_dialogues([H|T]) :-
    write('"'), write(H), write('"'), nl,
    print_dialogues(T).

give_rewards([]).
give_rewards([pieniadze(Amount)|T]) :-
    player_money(Money),
    NewMoney is Money + Amount,
    retract(player_money(Money)),
    assert(player_money(NewMoney)),
    write('Otrzymałeś '), write(Amount), write(' zł.'), nl,
    give_rewards(T).

/* Mechanika zakupów w Makro */
shop :-
    player_location(makro),
    write('Witaj w Makro! Co chcesz kupić?'), nl,
    list_items_for_sale,
    read(ItemName),
    attempt_purchase(ItemName).

shop :-
    write('Nie jesteś w Makro.'), nl.

list_items_for_sale :-
    item(Name, _, Description, _, Price),
    Price > 0,
    write(Name), write(' - '), write(Description), write(' - '), write(Price), write(' zł'), nl,
    fail.
list_items_for_sale.

attempt_purchase(ItemName) :-
    item(ItemName, _, _, _, Price),
    player_money(Money),
    Money >= Price,
    NewMoney is Money - Price,
    retract(player_money(Money)),
    assert(player_money(NewMoney)),
    player_inventory(Inventory),
    retract(player_inventory(Inventory)),
    assert(player_inventory([ItemName|Inventory])),
    write('Kupiłeś: '), write(ItemName), nl.

attempt_purchase(ItemName) :-
    item(ItemName, _, _, _, Price),
    player_money(Money),
    Money < Price,
    write('Nie masz wystarczająco pieniędzy.'), nl.

attempt_purchase(_) :-
    write('Nie ma takiego przedmiotu w sprzedaży.'), nl.

/* Mechanika walki */
fight :-
    player_location(drzwi_wejsciowe),
    npc(andrzej, drzwi_wejsciowe, _, _),
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
    item(ItemName, _, _, Properties, _),
    get_property(Properties, dmg(Damage)),
    get_property(Properties, heal(Heal)),
    write('Użyłeś '), write(ItemName), nl.

use_item(_, 0, 0) :-
    write('Nie możesz użyć tego przedmiotu.'), nl.

get_property([Prop|_], Prop).
get_property([_|T], Prop) :-
    get_property(T, Prop).

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
