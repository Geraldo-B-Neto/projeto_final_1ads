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

	funcao kartMaisLucrativo(cadeia &modelo[], real &valorLocacao[], inteiro &quantidadeLocacao[],real &receita, inteiro &totalKarts, inteiro diaAtualizado ){
		
		inteiro i, maisLucrativo = 0, maisLocado = -1

		para(i=0; i<=totalKarts; i++){
			
			para(i=0; i<=quantidadeLocacao[i]; i++){
				
				se(maisLocado < quantidadeLocacao[i] e valorLocacao[i] != 0 e diaAtualizado != 1){
					
					maisLocado = quantidadeLocacao[i]
					
					escreva("Modelo : ", modelo[i])
					escreva("\n valor de locacao : ", valorLocacao[i])
					escreva("\n Receita  : \n", receita)
					
				}
				senao{
					escreva("Ainda não possui Karts alugados! ")
				}
			}
		}
		retornaMenu()
		
		
	}

	
	funcao atualizarDia(cadeia &modelo[], real &valorLocacao[], inteiro &quantidadeLocacao[], real &receita, inteiro &totalKarts, inteiro &diaAtualizado){

		inteiro i

		para(i=0; i<=totalKarts; i++){
			
			se(totalKarts != 0){
				
				se(i<totalKarts){
		
					escreva("Devem ser cobrados o Karts de numero : \n", i , " - valor a ser debitado : ", valorLocacao[i])
				}senao se(i == totalKarts){
					escreva("\n Todos os ", i , " Karts foram cobrados.")
				}

				diaAtualizado = 1
	
			}
			senao{
					escreva("Não há Karts a serem cobrados!")
				}
			
			
			modelo[i] = ""
			quantidadeLocacao[i] = 0
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
			        
			        pare
			    caso 4:
			        // Código para alugar um Kart
			        alugarKart(modelo, valorLocacao, quantidadeLocacao, locado, receita)
			        pare
			    caso 5:
			        // Código para devolver um Kart
			        
			        pare
			    caso 6:
			        // Código para exibir o Kart que mais gerou ganhos
			        kartMaisLucrativo(modelo, valorLocacao, quantidadeLocacao, receita, totalKarts, diaAtualizado)
			        pare
			    caso 7:
			        // Código para mostrar a receita e lucro do dia
			        
			        pare
			    caso 8:
			        // Código para locação de circuito
			        
			        pare
			    caso 9:
			        // Código para atualizar o dia
			        atualizarDia(modelo, valorLocacao, quantidadeLocacao, receita, totalKarts, diaAtualizado)
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
