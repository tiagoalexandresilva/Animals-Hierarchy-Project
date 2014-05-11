%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SIST. REPR. CONHECIMENTO E RACIOCINIO - LEI/3

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Exercicio 3 - Batman

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Carregamento das bibliotecas

:- use_module( library( 'system' ) ).
:- use_module( library( 'linda/client' ) ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SICStus PROLOG: definicoes iniciais

:- dynamic e_um/3.
:- dynamic locomocao/1.
:- dynamic cobertura/1.
:- dynamic alimento/1.
:- dynamic som/1.
:- dynamic cor/1.
:- dynamic reproducao/1. 
:- dynamic reino/1. 
:- dynamic ciencia/1.
:- dynamic dominio/1.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Teoria do Agente Batman

alimento(fruta).
alimento(sangue).
cor(preto).
som(ultra-som).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado e_um: Agente,Classe,Lista -> {V,F}

e_um(batman,mamifero,[locomocao(_),alimento(_)]).
e_um(batman,ave,[cobertura(_),reproducao(_),alimento(_)]).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%Ligar e desligar o cliente

ligar(M,P) :- write('A ligar...'), nl,
				linda_client( M:P ),
				write('Ligado.'), nl.
				
desligar :- close_client.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Inicializacao da vida do agente Batman
%demo -> {V,F}

demo :-
    write( 'AGENTE: Batman' ),nl,
	write( 'A aguardar pedido...' ),nl,
    in(demo(batman,Questao)), nl,
    write( 'Pedido recebido!' ),nl,
	write( 'A responder ao pedido...' ), sleep(1),nl,nl,
    demo(batman,Questao),
    demo.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do meta-predicado demo: Agente,Questao -> {V,F}
	
demo(Agente,Questao) :- 
			findall(Questao,Questao,L),
			L \= [],
			out(prova(Agente,L)).

demo(Agente,Questao) :-
			e_um(Agente,Classe,Lista), nao(pertence(Questao,Lista)),
			out(demo(Classe,Questao)).

demo(Agente,Questao):-
			out(prova(Agente, 'Sem solucao para a questao.')).
	
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do meta-predicado pertence: Questao,Lista -> {V,F}
pertence(Q,L) :- member(Q,L).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do meta-predicado nao: Questao -> {V,F}

nao( Q ) :-
    Q, !, fail.
nao( Q ).