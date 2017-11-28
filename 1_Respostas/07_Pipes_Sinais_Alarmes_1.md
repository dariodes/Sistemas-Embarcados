1. Quantos pipes serão criados após as linhas de código a seguir? Por quê?

(a)
```C
int pid;
int	fd[2];
pipe(fd);
pid = fork();
```

	Apenas 1 pipe será criado, e esse pipe será compartilhado entre pai e filho.

(b)
```C
int pid;
int	fd[2];
pid = fork();
pipe(fd);
```

	Apenas 1 pipe será criado, porém ele não será compartilhado entre pai e filho.

2. Apresente mais cinco sinais importantes do ambiente Unix, além do `SIGSEGV`, `SIGUSR1`, `SIGUSR2`, `SIGALRM` e `SIGINT`. Quais são suas características e utilidades?

	`SIGQUIT`,`SIGSYS`,`SIGPIPE`,`SIGKILL`,`SIGBUS`.

3. Considere o código a seguir:

```C
#include <signal.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>

void tratamento_alarme(int sig)
{
	system("date");
	alarm(1);
}

int main()
{
	signal(SIGALRM, tratamento_alarme);
	alarm(1);
	printf("Aperte CTRL+C para acabar:\n");
	while(1);
	return 0;
}
```

Sabendo que a função `alarm()` tem como entrada a quantidade de segundos para terminar a contagem, quão precisos são os alarmes criados neste código? De onde vem a imprecisão? Este é um método confiável para desenvolver aplicações em tempo real?

	A precisão é boa, mas não é exata. Essa imprecisão vêm da chamada de outras funções e processos sendo executados. Esse não é um método confiável para desenvolver aplicações em tempo real.