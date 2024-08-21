programa
{
	inclua biblioteca Util --> u

	funcao retornaMenu(){
		u.aguarde(1500)
		para(inteiro i = 4 ; i > 0 ; i--){
				escreva("Retornando para o menu em ", i)
				u.aguarde(1000)
				limpa()
			}
	}
	
	funcao cadastrarKart(cadeia &modelo[], real &valorLocacao[], inteiro &quantidadeLocacao[], cadeia &locado[], inteiro &totalKarts){
		se(totalKarts < 15 ){
			escreva("Cadastrar Kart:\n")
			
			escreva("Modelo: ")
			leia(modelo[totalKarts])
	
			escreva("Valor: ")
			leia(valorLocacao[totalKarts])
	
			quantidadeLocacao[totalKarts] = 0

			locado[totalKarts] = "Não"

			totalKarts++

			escreva("Kart cadastrado com sucesso!\n")
			retornaMenu()
			
		}senao{
			escreva("O número limite de Karts cadastrados foi atingido!")
		}
		
	}
	
	funcao kartsDisponiveis(cadeia modelo[], real valorLocacao[], inteiro quantidadeLocacao[], cadeia locado[], inteiro totalKarts){
    		inteiro verificaKart = 0

    escreva("Karts Disponíveis para Aluguel:\n")
    escreva("*****************************\n")

    para(inteiro i = 0 ; i < totalKarts ; i++ ){
        // Verifica se o kart não foi alugado e se não há campos em branco
        se(locado[i] == "Não" e modelo[i] != "" e valorLocacao[i] != 0.0){
            verificaKart = 1
            escreva("Número: ", i, "\n")
            escreva("Modelo: ", modelo[i], "\n")
            escreva("Valor: R$", valorLocacao[i], "\n")
            escreva("Quantidade de vezes em que foi locado: ", quantidadeLocacao[i], "\n")
            escreva("*****************************\n")
        }
    }

    se(verificaKart == 0){
        escreva("Não há karts disponíveis para aluguel.\n")
    }

    retornaMenu()
}

	funcao listarKartsLocados(cadeia &modelo[], inteiro &quantidadeLocacao[], cadeia &locado[], inteiro &totalKarts, inteiro&diaAtualizado){

		inteiro i, verificaKart = 0

		escreva("Os Karts locados são:\n")
		escreva("*****************************\n")

		
		para(i=0; i<=totalKarts; i++){
			se(locado[i] == "Sim"){
				verificaKart = 1
				escreva("Modelo: ", modelo[i], "\n")
			}
		}
		se(verificaKart != 1){
			escreva("Nenhum kart locado ainda ! \n")
		}
		

		retornaMenu()
		
	}

	funcao alugarKart(cadeia modelo[], real valorLocacao[], inteiro quantidadeLocacao[], cadeia locado[], real &receita){
		inteiro kart, verificaKart = 0

		escreva("Alugar Kart!\n")
		escreva("*****************************\n")
		
		para(inteiro i = 0 ; i < 15 ; i++ ){
			se(locado[i] == "Não"){
				verificaKart = 1
				escreva("Número: ", i, "\n")
				escreva("Modelo: ", modelo[i], "\n")
				escreva("Valor: R$", valorLocacao[i], "\n")
				escreva("Quantidade de vezes em que foi locado: ", quantidadeLocacao[i], "\n")
				escreva("*****************************\n")
			}
		}

		se(verificaKart == 1){
			escreva("Digite o número correspondente ao carro em que deseja alugar: ")
			leia(kart)
	
			locado[kart] = "Sim"
			quantidadeLocacao[kart] += 1
	
			escreva("Kart alugado com sucesso!\n")
		}senao{
			escreva("Infelizmente, não há karts disponíveis.\n")
		}
		
		retornaMenu()
	}

	funcao devolverKart(cadeia &locado[],inteiro &totalKarts,cadeia modelo[], inteiro diaAtualizado){
		
		inteiro i, verificaKart[15], kartLocado[15], x = 0
		
		para(i=0; i<totalKarts; i++){
			
			se(locado[i] == "Sim"){
				x = 1
				
				escreva("O carro modelo: ", modelo[i], " está locado, tecle 0 para devolve-lo ou qualquer outro para cancelar \n")
				leia(verificaKart[i])

				
				se(verificaKart[i] == 0){
					
					locado[i] = "Não"
					escreva("O kart modelo ", modelo[i], " foi devolvido ! \n")
			
				}senao{
					
					escreva("A devoluçãpo do kart modelo ", modelo[i], " foi cancelada ! \n")
			
				}
				
			}
			
		}

		se(x ==0){
				escreva("Alugue um kart primeiro! \n")
			}

		retornaMenu()
		
	}

	funcao kartMaisLucrativo(cadeia &modelo[], real &valorLocacao[], inteiro &quantidadeLocacao[],real &receita, inteiro &totalKarts, inteiro &diaAtualizado, cadeia &locado[]){
		
		inteiro i, acumulador = 0, maisLocado = 0

		escreva("O kart com maio receita é :\n")
		escreva("*****************************\n")

		se(totalKarts != 0){
			para(i=0; i<totalKarts; i++){
					
				se(quantidadeLocacao[i] > maisLocado ){
					
					se(locado[i]== "Sim" e diaAtualizado != 1){
	
						maisLocado = quantidadeLocacao[i]

						acumulador = i
								
						}
							
					}
			}
			se(acumulador != -1){
				
	            escreva("Modelo: ", modelo[acumulador], "\n")
	            escreva("Valor de locação: R$", valorLocacao[acumulador], "\n")
	            escreva("Quantidade de vezes alugado: ", acumulador, "\n")
	            
        		}senao {
           		 escreva("Nenhum kart foi locado.\n")
        		}
					
		}senao{
			escreva("Aloque um kart para primeiro !")
		}
		retornaMenu()
		
		
	}
	
	funcao atualizarDia(cadeia &modelo[], real &valorLocacao[], inteiro &quantidadeLocacao[], real &receita, inteiro &totalKarts, cadeia &locado[],  inteiro &diaAtualizado){

		inteiro i

		escreva("O dia está reiniciando \n")
		escreva("*****************************\n")

		para(i=0; i<totalKarts; i++){
			
			se(totalKarts != 0){
				
				se(i<totalKarts){
		
					escreva("Devem ser cobrados o Karts de numero : \n", i , " - valor a ser debitado : ", valorLocacao[i], "\n")
				}senao se(i == totalKarts){
					escreva("\n Todos os ", i , " Karts foram cobrados.")
				}

				diaAtualizado = 1
	
			}
			senao{
					escreva("Não há Karts a serem cobrados!")
				}

			locado[i] = "Não"
			receita = 0.0
		}

		retornaMenu()
	}
	

	funcao menu(){
		inteiro opcao = 0, quantidadeLocacao[15], totalKarts = 0, diaAtualizado
		real valorLocacao[15], receita = 0.0
		cadeia modelo[15], locado[15]

		diaAtualizado = 0

		enquanto(opcao != 10){
			limpa()
			
			escreva("Escolha uma das opções abaixo!\n")
			escreva("1. Cadastrar um Kart\n")
			escreva("2. Listar Karts disponíveis\n")
			escreva("3. Listar Karts locados\n")
			escreva("4. Alugar um Kart\n")
			escreva("5. Devolver um Kart\n")
			escreva("6. Kart que mais gerou ganhos\n")
			escreva("7. Receita e lucro do dia, considerando karts locados\n")
			escreva("8. Locação de circuito\n")
			escreva("9. Atualizar dia\n")
			escreva("10. Sair do programa\n\n")
			escreva("Digite o número correspondente à opção desejada: ")
	
			leia(opcao)
	
			limpa()
	
			escolha(opcao){
				caso 1:
			        // Código para cadastrar um Kart
			       cadastrarKart(modelo, valorLocacao, quantidadeLocacao, locado, totalKarts)
			        pare
			    caso 2:
			        // Código para listar Karts disponíveis
			        kartsDisponiveis(modelo, valorLocacao, quantidadeLocacao, locado, totalKarts)
			        pare
			    caso 3:
			        // Código para listar Karts locados
			        listarKartsLocados(modelo, quantidadeLocacao, locado, totalKarts, diaAtualizado)
			        pare
			    caso 4:
			        // Código para alugar um Kart
			        alugarKart(modelo, valorLocacao, quantidadeLocacao, locado, receita)
			        pare
			    caso 5:
			        // Código para devolver um Kart
			        devolverKart(locado, totalKarts,modelo, diaAtualizado)
			        pare
			    caso 6:
			        // Código para exibir o Kart que mais gerou ganhos
			        kartMaisLucrativo(modelo, valorLocacao, quantidadeLocacao, receita, totalKarts, diaAtualizado,locado)
			        pare
			    caso 7:
			        // Código para mostrar a receita e lucro do dia
			        
			        pare
			    caso 8:
			        // Código para locação de circuito
			        
			        pare
			    caso 9:
			        // Código para atualizar o dia
			        atualizarDia(modelo, valorLocacao, quantidadeLocacao, receita, totalKarts, locado, diaAtualizado)
			        pare
			    caso 10:
			        // Código para sair do programa
			        
			        pare
			    caso contrario:
			        
			        pare
			}
		}

	}
	
	funcao inicio()
	{
		menu()
	}
}
