// Alunos:
// Jo�o Vitor Ekert - RA 2220831
// Marcio da Silva Gomes - RA 2221000 

Program Compra_e_Venda_de_Carros_Usados ;
type
	opcional = record
		oN : array[1..4] of string;   // oN = Opcional Nome
		oPR: array[1..4] of integer;  // oPR = Opcional Pre�o de Revenda
		oPC: array[1..4] of integer;  // oPC = Opcional Pre�o de Custo
		oPL: array[1..4] of integer;  // oPL = Opcional Pre�o LUCRO
	end;
	fichaCadastral = record
		marca        : string;
		modelo       : string;
		valorCompra  : integer;
		valorVenda   : integer;
		acessorios   : opcional; 
	end;		


Const
	MAX = 4;

	//Opcionais	- Nomes (oN)
	oNArCond    = 'Ar Condicionado   ';           
	oNVidroElet = 'Vidro El�trico    ';       
	oNAlarme    = 'Alarme            ';          
	oNInsulfilm = 'Insulfilm         ';

	//Opcionais	- Pre�o de Custo (oPC)
	oPCArCond    = 1000;           
	oPCVidroElet = 650;       
	oPCAlarme    = 120;          
	oPCInsulfilm = 90;
	
	//Opcionais	- Pre�o de Revenda (oPR)
	oPRArCond    = 1500;           
	oPRVidroElet = 800;       
	oPRAlarme    = 200;          
	oPRInsulfilm = 150;
		
	
Var
	//Escolha de Opicionais para o ve�culo
	opcao: integer;
	lucroOp, lucroVenda: real;
	i, j: integer;
	valorTotalOPC, valorTotalOPR, valorTotalOPL, valorVendaFinal, valorVenda: integer;
	veiculo: array [1..MAX] of fichaCadastral;	
		
	
Begin
	for i := 1 to MAX do
	begin
		gotoxy (21,1);
		write	('Ficha Cadastral do ',i,'� Ve�culo');
		writeln;
		write (' Informe a MARCA......................................: ');
    readln (veiculo[i].marca);
    write (' Informe o MODELO.....................................: ');
    readln (veiculo[i].modelo);
    write (' Informe o valor de COMPRA (ex: 25000)................: R$ ');
    readln (veiculo[i].valorCompra);
    write (' Informe o valor inicial de VENDA (ex: 34000).........: R$ ');
    readln (veiculo[i].valorVenda);
    
    writeln;
    writeln;
    writeln;
    writeln;
		gotoxy(25,9);
    writeln ('Escolha de Opcionais');
		
    for j := 1 to 4 do    	
		begin
			writeln ('              Selecione o ', j, '� item para o ve�culo ', veiculo[i].modelo, ':');
			writeln ('|-----------------------------------------------------------------|');
			writeln ('|       Opcional      |   Pre�o de Custo   |   Pre�o de Revenda   |');
			writeln ('|1 - Ar Condicionado  |', '':4, ' R$ '  , oPCArCond:6:2,   '|':6, '':4, '  R$ '  ,oPRArCond   :6:2, '':6,'|');  
			writeln ('|2 - Vidro El�trico   |', '':4, ' R$  ' , oPCVidroElet:6:2,'|':6, '':4, '  R$  ' ,oPRVidroElet:6:2, '':6,'|');
 			writeln ('|3 - Alarme           |', '':4, ' R$  ' , oPCAlarme:6:2,   '|':6, '':4, '  R$  ' ,oPRAlarme   :6:2, '':6,'|');
			writeln ('|4 - Insulfilm        |', '':4, ' R$  ' , oPCInsulfilm:6:2,'|':6, '':4, '  R$  ' ,oPRInsulfilm:6:2, '':6,'|');
			writeln ('|-----------------------------------------------------------------|');
			writeln ('|0 - Opcionais n�o compat�veis com o ve�culo / PARAR com a sele��o|');
			writeln ('|-----------------------------------------------------------------|');
			writeln;
			writeln (' Digite o n�mero correspondente: (0 a 4)');
			write (' ');
			read (opcao);
			
			// Ao selecionar o n�mero correspondente (1 a 4), ira armazenar os dados de 
			// Nome do Opcional, Pre�o de Custo, Pre�o de Revenda e calculo para o Lucro do item.	
			if (opcao = 1) or (opcao = 2) or (opcao = 3) or (opcao = 4) then         
    	begin		
				if opcao = 1 then
   			begin
   				veiculo[i].acessorios.oN[j]  := oNArCond;
   				veiculo[i].acessorios.oPC[j] := oPCArCond;
    			veiculo[i].acessorios.oPR[j] := oPRArCond;
					veiculo[i].acessorios.oPL[j] := (oPRArCond - oPCArCond);		
				end;
			
				if opcao = 2 then
    		begin
    			veiculo[i].acessorios.oN[j]  := oNVidroElet;
    			veiculo[i].acessorios.oPC[j] := oPCVidroElet;
   				veiculo[i].acessorios.oPR[j] := oPRVidroElet;
   				veiculo[i].acessorios.oPL[j] := (oPRVidroElet - oPCVidroElet);
				end;
				
				if opcao = 3 then
	    	begin
  	 			veiculo[i].acessorios.oN[j]  := oNAlarme;
  	 			veiculo[i].acessorios.oPC[j] := oPCAlarme;
   				veiculo[i].acessorios.oPR[j] := oPRAlarme;
   				veiculo[i].acessorios.oPL[j] := (oPRAlarme - oPCAlarme);
				end;
				
				if opcao = 4 then
	    	begin
  	 			veiculo[i].acessorios.oN[j]  := oNInsulfilm;
  	 			veiculo[i].acessorios.oPC[j] := oPCInsulfilm;
   				veiculo[i].acessorios.oPR[j] := oPRInsulfilm;
					veiculo[i].acessorios.oPL[j] := (oPRInsulfilm - oPCInsulfilm);   		
				end;
				
				writeln;
				writeln;
				writeln;
			end
			// Caso a op��o seja diferente de 0 (zero),
			//ira interromper a escolha dos opcionais.
    	else   
			begin
				break	
			end;
		end;
		clrscr;		
	end;       		      
    
  
  clrscr;
  for i := 1 to MAX do
  begin
  	valorTotalOPC := 0;    // Valor total dos Opcionais Pre�o de Custo
  	valorTotalOPR := 0;    // Valor total dos Opcionais Pre�o de Revenda
  	valorTotalOPL := 0;    // Valor total dos Opcionais Pre�o de Lucro
  	for j := 1 to 4 do
  	begin
  		//Calculo para saber Pre�o de Custo dos Opcionais 
			valorTotalOPC   := valorTotalOPC + veiculo[i].acessorios.oPC[j];
			
			//Calculo para saber Pre�o de Revenda dos Opcionais              
  		valorTotalOPR   := valorTotalOPR + veiculo[i].acessorios.oPR[j];
			
			//Calculo para saber Valor de lucro dos Opcionais 
			valorTotalOPL   := valorTotalOPL + veiculo[i].acessorios.oPL[j];
			
			//Calculo para saber Valor de Venda Final do ve�culo (sem opcionais)
			valorVendaFinal := veiculo[i].valorVenda + valorTotalOPR; 
			
			//Calculo para saber Valor de Lucro da venda (ve�culo + opcionais) 
			lucroVenda      := valorTotalOPL + (veiculo[i].valorVenda - veiculo[i].valorCompra);			
  	end;
  	
  	
  	writeln ('---------------------------- Ficha do ',i,'� Ve�culo ---------------------------');
  	writeln;
		writeln (' Marca.........................................................: ', veiculo[i].marca);
		writeln (' Modelo........................................................: ', veiculo[i].modelo);
		writeln (' Valor de compra...............................................: R$ ', veiculo[i].valorCompra:6:2);
		writeln (' Valor de venda (sem os opcionais).............................: R$ ', veiculo[i].valorVenda:6:2);
		writeln;
		writeln (' __________________________________________________________________________');
		writeln ('|Opcionais escolhidos | Valor de Custo | Valor de Revenda |      Lucro     |');
    

		for j := 1 to 4 do
		begin
			// Ira gerar os itens que foram selecionados para o ve�culo
			writeln	('| - ', veiculo[i].acessorios.oN[j], '|  R$ ', veiculo[i].acessorios.oPC[j]:9:2, '':2, '|   R$ ', veiculo[i].acessorios.oPR[j]:9:2,'':3, '|  R$ ', (veiculo[i].acessorios.oPR[j] - veiculo[i].acessorios.oPC[j]):9:2,'  |');	
		end;
		                                               
	  writeln ('|_____________________|________________|__________________|________________|');
		
		// Ira gerar/imprimir o valor total de Pre�o de Custo, Pre�o de Revenda e Lucro.
		writeln ('':22, '|  R$ ', valorTotalOPC:9:2, '  |   R$ ', valorTotalOPR:9:2,  '   |  R$ ', valorTotalOPL:9:2,'  |');
		writeln ('':22, '|________________|__________________|________________|');
		writeln ('':22, '|                        TOTAL                       |');
		writeln ('':22, '|----------------------------------------------------|');
		writeln;
		writeln (' Valor final de venda do ve�culo...............................: R$ ', valorVendaFinal:6:2);
		writeln (' Lucro da venda deste ve�culo..................................: R$ ', lucroVenda:6:2);
		writeln;
		writeln;
		writeln;
	end;                                                      
	
End.