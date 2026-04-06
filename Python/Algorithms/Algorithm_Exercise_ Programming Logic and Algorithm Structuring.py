# Pede ao utilizador para introduzir um número real (float) negativo. 
# • Usa try-except para garantir que o valor introduzido é um número real. 
# • Se o valor não for real ou não for negativo, mostra mensagem de erro e pede novamente até ser válido. 
# • Quando for válido, imprime o número. 


num = float(input("Introduz um número real negativo: "))
try:
    if num < 0:
        print(f" O múmero é {num}")
    
except: ValueError
print("Erro:Introduz novamente um número real negativo")       


# Cria um programa que pede ao utilizador um número inteiro positivo menor que 20. 
# • Usa try-except para garantir que o valor é inteiro. 
# • Se não for inteiro, se for negativo/zero, ou se for maior ou igual a 20, mostra mensagem de erro e pede novamente até ser 
# válido. 
# • Depois, mostra uma contagem regressiva desse número até 0, um número por linha. 


try:
    n= int(input("Introduz um número inteiro positivo  menor que 20: "))
    if n == 0 or n >=20:    
        print("ERRO: Valor inválido")
except:
    print("Erro:Introduz um númenro inteiro positivo menor que 20")
    

    for x in range (1, n,-1):
            print(x)
        
               





     
     
# Desenvolve um programa com o seguinte menu, usando while True: 
# 1. Verificar se dois números inteiros são múltiplos um do outro 
# 2. Calcular o quociente inteiro e o resto da divisão entre dois números inteiros 
# 3. Sair 
# • O menu repete até o utilizador escolher 3. 
# • Para a escolha do menu, se o utilizador introduzir opção inválida, mostra mensagem de erro e volta ao menu. 
# • Para as opções 1 e 2, pede dois números inteiros ao utilizador, valida cada número com try-except e repete o pedido até 
# ser válido. 
# • Na opção 1, indica se um número é múltiplo do outro ou não. 
# • Na opção 2, mostra o resultado da divisão inteira e o resto. Se o divisor for zero, mostra mensagem de erro. 


num1= int(input("Introduza o primeiro número: "))
num2= int(input("Introduza o segundo número: "))

print("Escolha um menu")
print("1- Verificar se dois números inteiros são múltiplos um do outro" )
print("2- Calcular o quociente inteiro e o resto da divisão entre dois números inteiros ")
print("3- Sair  ")
    

while True:
    try:
        opcao= int(input("Selecione uma opção válida: "))
        if opcao == 3:
            break
        elif opcao == 2:
            num1= int(input("Introduza o primeiro número: "))
            num2= int(input("Introduza o segundo número: "))
            quociente= num1//num2
            resto = num1 % num2
            print( f" o quociente é {quociente} e o resto {resto}")
            break
    except ValueError:
        print("Erro: Volta a inserir um numero inteiro") 
        num1= int(input("Introduza o primeiro número: "))
        num2= int(input("Introduza o segundo número: "))
         
        elif opcao == 1:
        try:
           if num1 % num2 == 0:
                print(f" {num2} é multiplo de {num1}")
           
           if num2 % num1 ==0:
               print(f" {num2} é multiplo de {num1}")
               break
        except ValueError:
            print("Erro: Volta a inserir um numero inteiro") 
            num1= int(input("Introduza o primeiro número: "))
            num2= int(input("Introduza o segundo número: "))
       
    
            
            
    
            
        

        

    



    
    
# Cria um programa que pede ao utilizador a sua idade. 
# • Usa try-except para garantir que o valor introduzido é um número inteiro positivo. 
# • Se a idade for inferior a 0 ou não for um número inteiro, mostra mensagem de erro e pede novamente. 
# • Depois, classifica a idade em: 
#  "Criança" (de 0 até 12) 
#  "Adolescente" (de 13 até 17) 
#  "Adulto" (de 18 a 64) 
#  "Idoso" (de 65 ou mais)

while True:
    try:
        idade= int((input("Introduza a tua idade: ")))
        if idade < 0:
            print ("Idade não válida")
            idade= int((input("Introduza a tua idade: "))) 
    
    
        if idade <= 12:
            print("Criança")
        elif 13 < idade <= 17:
            print("Adolescente")
        elif 18 < idade <= 64:
            print(" Adulto")
        else:
            print("Idoso")
        break
    except ValueError:
        print("Erro: Introduz um valor válido") 
    
    
    
        
