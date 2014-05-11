%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SIST. REPR. CONHECIMENTO E RACIOCINIO - LEI/3

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Exercicio 3 - Interface

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Carregamento das bibliotecas

:- use_module( library( 'system' ) ).
:- use_module( library( 'linda/client' ) ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%Ligar e desligar o cliente

ligar(M,P) :- write('A ligar...'), nl,
				linda_client( M:P ),
				write('Ligado.'), nl.
				
desligar :- close_client.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Consulta do estado do QUADRO NEGRO

qn( L ) :-
    bagof_rd_noblock( X,X,L ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%% Extensao do meta-predicado pedido: Agenta,Pergunta -> {V,F}
	
pedido(Agente,Pergunta) :-
	write('A perguntar a um agente...'), nl,
	out(demo(Agente,Pergunta)),
	sleep(1), write('...e esperando pela resposta.'), nl, nl,
	in(prova(X,S)),
	sleep(1), write('Resposta recebida!'), nl,
			  write('Resposta:'), write(S), nl.
			  
			  
			  
			 
			   
			   
			   

	