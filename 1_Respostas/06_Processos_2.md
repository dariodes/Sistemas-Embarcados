1. Crie um código em C para gerar três processos-filho usando o `fork()`.

```c
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>

int main(int argc, char *argv[]){

    pid_t child_1, child_2, child_3;

    child_1 = fork();

    if(child_1 == 0){
		printf("* Este texto foi escrito no terminal pelo processo FILHO 1 (ID=%d) *\n", (int) getpid());
 
    }
    else{
        child_2 = fork();
        if(child_2 == 0){
    		printf("* Este texto foi escrito no terminal pelo processo FILHO 2 (ID=%d) *\n", (int) getpid());
        }
        else{
            child_3 = fork();
            if(child_3 == 0){
                printf("* Este texto foi escrito no terminal pelo processo FILHO 3 (ID=%d) *\n", (int) getpid());                
            }
            else{
                sleep(1);
                printf("* Este texto foi escrito no terminal pelo processo PAI     (ID=%d) *\n", (int) getpid());                
                printf("*             Seus filhos tem o ID %d, %d, %d.               *\n",child_1,child_2,child_3);
            }
        }
    }

    return 0;
}
```

2. Crie um código em C que recebe o nome de diversos comandos pelos argumentos de entrada (`argc` e `*argv[]`), e executa cada um sequencialmente usando `system()`. Por exemplo, considerando que o código criado recebeu o nome de 'serial_system', e que ele foi executado na pasta '/Sistemas_Embarcados/Code/06_Processos', que contem diversos arquivos:

```bash
$ ./serial_system pwd echo ls echo cal
$ ~/Sistemas_Embarcados/Code/06_Processos
$
$ Ex1.c    Ex2b.c   Ex4.c   Ex6.c
$ Ex2a.c   Ex3.c    Ex5.c   serial_system
$
$     Março 2017
$ Do Se Te Qu Qu Se Sá
$           1  2  3  4
$  5  6  7  8  9 10 11
$ 12 13 14 15 16 17 18
$ 19 20 21 22 23 24 25
$ 26 27 28 29 30 31
```

```c
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>

int main(int argc, char *argv[]){

    int i;

    for(i=1;i<argc;i++){
        system(argv[i]);
    }

    return 0;
}
```

3. Crie um código em C que recebe o nome de diversos comandos pelos argumentos de entrada (`argc` e `*argv[]`), e executa cada um usando `fork()` e `exec()`.

```c
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>
#include <string.h>
  
int main(int argc, char **argv) {
    int i;
    pid_t pid_filho;
    char *lista_de_argumentos[2] = {"command-line",NULL};

    for(i=1;i<argc;i++){
        pid_filho = fork();
        if(pid_filho == 0){
            sleep(1);
            execvp(argv[i],lista_de_argumentos);
        }
        else{}
    }

    return 0;
}
```

4. Crie um código em C que gera três processos-filho usando o `fork()`, e que cada processo-filho chama a seguinte função uma vez:

```C
int v_global = 0; // Variavel global para este exemplo
void Incrementa_Variavel_Global(pid_t id_atual)
{
	v_global++;
	printf("ID do processo que executou esta funcao = %d\n", id_atual);
	printf("v_global = %d\n", v_global);
}
```

```c
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>

int v_global = 0; // Variavel global para este exemplo
void Incrementa_Variavel_Global(pid_t id_atual)
{
	v_global++;
	printf("ID do processo que executou esta funcao = %d\n", id_atual);
	printf("v_global = %d\n", v_global);
}

int main(int argc, char *argv[]){

    pid_t child_1, child_2, child_3;

    child_1 = fork();

    if(child_1 == 0){
        Incrementa_Variavel_Global((int)getpid());
    }
    else{
        child_2 = fork();
        if(child_2 == 0){
            Incrementa_Variavel_Global((int)getpid());
        }
        else{
            child_3 = fork();
            if(child_3 == 0){
                Incrementa_Variavel_Global((int)getpid());                
            }
            else{
                sleep(1);
                printf("Este texto foi escrito no terminal pelo processo PAI     (ID=%d)\n", (int) getpid());
            }
        }
    }

    return 0;
}
```

(Repare que a função `Incrementa_Variavel_Global()` recebe como entrada o ID do processo que a chamou.) Responda: a variável global `v_global` foi compartilhada por todos os processos-filho, ou cada processo enxergou um valor diferente para esta variável?

    A variável global foi compartilhada por todos os processos filhos.

5. Repita a questão anterior, mas desta vez faça com que o processo-pai também chame a função `Incrementa_Variavel_Global()`. Responda: a variável global `v_global` foi compartilhada por todos os processos-filho e o processo-pai, ou cada processo enxergou um valor diferente para esta variável?

```c
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>

int v_global = 0; // Variavel global para este exemplo
void Incrementa_Variavel_Global(pid_t id_atual)
{
	v_global++;
	printf("ID do processo que executou esta funcao = %d\n", id_atual);
	printf("v_global = %d\n", v_global);
}

int main(int argc, char *argv[]){

    pid_t child_1, child_2, child_3;

    child_1 = fork();

    if(child_1 == 0){
        Incrementa_Variavel_Global((int)getpid());
    }
    else{
        child_2 = fork();
        if(child_2 == 0){
            Incrementa_Variavel_Global((int)getpid());
        }
        else{
            child_3 = fork();
            if(child_3 == 0){
                Incrementa_Variavel_Global((int)getpid());                
            }
            else{
                sleep(1);
                Incrementa_Variavel_Global((int)getpid()); 
            }
        }
    }

    return 0;
}
```

    Todos od processos enxergaram o mesmo valor de v_global.