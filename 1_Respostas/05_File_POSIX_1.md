1. Considerando a biblioteca-padrão da linguagem C, responda:

(a) Quais são as funções (e seus protótipos) para abrir e fechar arquivos?

    fopen
        FILE *fopen(const char *filename, const char *mode);
    fclose
        int fclose(FILE *stream);

(b) Quais são as funções (e seus protótipos) para escrever em arquivos?

    fwrite
        size_t fwrite(const void *ptr, size_t size, size_t nmemb, FILE *stream);

(c) Quais são as funções (e seus protótipos) para ler arquivos?

    fread
        size_t fread(void *ptr, size_t size, size_t nmemb, FILE *stream);

(d) Quais são as funções (e seus protótipos) para reposicionar um ponteiro para arquivo?

    fseek
        int fseek(FILE *stream, long int offset, int whence);

(e) Quais bibliotecas devem ser incluídas no código para poder utilizar as funções acima?

    Bibliotecas:
        #include <stdio.h>

2. O que é a norma POSIX?

    POSIX é uma família de normas definidas pelo IEEE para a manutenção de compatibilidade entre sistemas operacionais. POSIX define a interface de programação de aplicações (API), juntamente com shells de linha e comando e interfaces utilitárias, para compatibilidade de software com variantes de Unix e outros sistemas operacionais.

3. Considerando a norma POSIX, responda:

(a) Quais são as funções (e seus protótipos) para abrir e fechar arquivos?

    open
        int open(const char* path, int oflag, ...);
    close
        int close(int fildes);

(b) Quais são as funções (e seus protótipos) para escrever em arquivos?

    write
        ssize_t write(int fildes, const void *buf, size_t nbyte);

(c) Quais são as funções (e seus protótipos) para ler arquivos?

    read
        ssize_t read(int fildes, void *buf, size_t nbyte);

(d) Quais são as funções (e seus protótipos) para reposicionar um ponteiro para arquivo?

    lseek
        off_t lseek(int fd, off_t offset, int whence);

(e) Quais bibliotecas devem ser incluídas no código para poder utilizar as funções acima?

    Bibliotecas:
        #include <fcntl.h>	
        #include <unistd.h>	