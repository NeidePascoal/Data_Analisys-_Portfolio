# 1. Variáveis e Operações Básicas (2 valores)
# Crie um programa que solicite ao utilizador o seu peso (em kg) e altura (em metros). Calcule e imprima o Índice de Massa Corporal (IMC) e classifique-o como "Abaixo do peso" (IMC < 18.5), "Peso normal" (18.5 ≤ IMC < 25), ou "Acima do peso" (IMC ≥ 25).
# • A fórmula para o cálculo do IMC é IMC= PESO/(ALTURA2)


peso= float(input(" Introduz o seu peso (kg): "))
altura= float(input(" Introduz a sua altura em metros: "))

imc= peso/(altura**2)
print(f" O seu IMC é: {imc:.2f}")












# 2. Estruturas Condicionais Simples (2 valores)
# Desenvolva um programa que peça ao utilizador para inserir um ano. O programa deve verificar se o ano é bissexto ou não. (Um ano é bissexto se: for divisível por 4 e não for divisível por 100 OU se for divisível por 400).
# se for divisivel por 4 and não divisivel por 100 = % 4 ==0
#divisivel por 400-- % 400    %100 !=0

ano= int(input("Introduz um ano: "))
if ano % 4 ==0 and ano != 100:
    print ( f"{ano} é um ano bissexto")
else:
    print( f"{ano} Não é considerado um ano bissexto ")



# 3. Estruturas Condicionais Compostas (2 valores)
# Crie um programa que solicite ao utilizador a sua idade e se possui carta de condução (sim/não). Com base nas respostas, o programa deve indicar:
# - "Não pode conduzir" (idade < 18 ou sem carta)
# - "Pode conduzir, mas com restrições" (18 ≤ idade < 21 e com carta)
# - "Pode conduzir sem restrições" (idade ≥ 21 e com carta)

idade= int(input("Introduza a tua idade: "))
cconducão= str(input("Possui carta de condução ( Sim/Não): "))
if idade < 18 or cconducão == "Não":
    print(" Não pode conduzir")

elif 18 <= idade < 21 or cconducão == "Sim":
    print("Pode conduzir, mas com restrições")

else:
    print("pode conduzir sem restrições")




# 4. Estruturas de Repetição (3 valores)
# Implemente um programa que solicite ao utilizador um número inteiro positivo n. O programa deve imprimir um padrão de cardinais formando um triângulo retângulo com n linhas. Por exemplo, para n = 4: 
# #
# ##
# ###
# ####
# • Para imprimir uma repetição de um símbolo, escrever: print(n*”#”)

num= int(input("Introduza um numéro inteiro: "))

for x in range(1, num):
    
    print (x*"#")
           




# 5. Listas e Operações Matemáticas (2 valores)
# Crie um programa que permita ao utilizador inserir 6 números inteiros numa lista. O programa deve então:
# a. Calcular e imprimir a soma de todos os números pares na lista.
# b. Encontrar e imprimir o maior número da lista.

