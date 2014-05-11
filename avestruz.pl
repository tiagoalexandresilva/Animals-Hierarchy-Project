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
% Teoria do Agente Avestruz

locomocao(solo).
alimento(sementes).
alimento(ervas).
cor(preto).
cor(branco).
som(pio).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado e_um: Agente,Classe,Lista -> {V,F}

e_um(avestruz,ave,[locomocao(_), alimento(_)]).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%Ligar e desligar o cliente

ligar(M,P) :- write('A ligar...'), nl,
				linda_client( M:P ),
				write('Ligado.'), nl.
				
desligar :- close_client.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Inicializacao da vida do agente Avestruz
%demo -> {V,F}

demo :-
    write( 'AGENTE: Avestruz' ),nl,
	write( 'A aguardar pedido...' ),nl,
    in(demo(avestruz,Questao)), nl,
    write( 'Pedido recebido!' ),nl,
	write( 'A responder ao pedido...' ), sleep(1),nl,nl,
    demo(avestruz,Questao),
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