# Stock Manager — versão gratuita

Aplicação web responsiva e instalável (PWA) para gerir o stock de uma única loja/armazém.

## Incluído
- Criar, editar e eliminar artigos.
- Categorias iniciais: Acessórios, Calças, Calçado, Perfumes, Ambientadores, Casacos, Camisolas, T-shirts e Vestidos.
- Criar novas categorias.
- Alterar quantidades diretamente com os botões `+1` e `−1` ou no formulário.
- Pesquisa por nome/referência e filtro por categoria.
- Estado visual: 0 ou 1 unidade = vermelho; 2 a 5 = amarelo; acima de 5 = verde.
- Conta por email/palavra-passe.
- Sincronização em tempo real através do Supabase.
- Não inclui leitura de códigos de barras nem histórico de entradas/saídas.

## Publicar sem mensalidade (com limites dos planos gratuitos)

### 1. Criar a base de dados no Supabase
1. Cria uma conta em https://supabase.com e um projeto no plano Free.
2. Abre `SQL Editor` no painel do projeto.
3. Copia todo o conteúdo de `supabase-setup.sql`, cola no editor e executa.
4. Em `Project Settings` → `API`, copia o `Project URL` e a chave publicável (`anon` ou `publishable`). Nunca uses `service_role` ou secret key no browser.

### 2. Preparar o site no GitHub Pages
1. Cria uma conta em https://github.com.
2. Cria um repositório novo, por exemplo `stock-manager`.
3. Envia os ficheiros deste pacote para a raiz do repositório (`index.html`, `manifest.webmanifest`, `sw.js`, `icon.svg`).
4. No repositório, abre `Settings` → `Pages`.
5. Em `Build and deployment`, escolhe `Deploy from a branch`, seleciona `main` e `/ (root)`, e guarda.
6. O GitHub mostrará o endereço público do site quando a publicação terminar.

### 3. Ligar a aplicação ao Supabase
1. Abre o endereço publicado.
2. Introduz o `Project URL` e a chave publicável copiados no passo 1.
3. Cria a tua conta com email e palavra-passe.
4. Ao entrares pela primeira vez, as nove categorias iniciais são criadas automaticamente.

### 4. Instalar no telemóvel
- Android: abre o site no Chrome e escolhe `Instalar aplicação` ou `Adicionar ao ecrã inicial`.
- iPhone: abre no Safari, toca em `Partilhar` e escolhe `Adicionar ao ecrã principal`.
- No computador: usa o botão de instalação que aparece na barra de endereço, se o navegador o disponibilizar.

## Notas importantes sobre custos e limites
- GitHub Pages é alojamento estático gratuito para repositórios elegíveis, sujeito às políticas e limites do GitHub.
- Supabase Free tem quotas de base de dados, tráfego, autenticação e realtime. Projetos gratuitos podem ser pausados por inatividade e não incluem as garantias de disponibilidade/backup dos planos pagos. Confirma sempre os limites atuais na página oficial de preços.
- Não introduzas dados sensíveis. A chave publicável é própria para uso no cliente; a segurança depende das políticas RLS incluídas no SQL.
- A aplicação precisa de internet para sincronizar. A interface pode abrir em cache, mas as alterações offline não são guardadas numa fila de sincronização.
- Este pacote é uma primeira versão funcional. Testa com alguns artigos antes de depender dela para o inventário real.

## Resolução de problemas
- Se surgir erro ao carregar, confirma se executaste o SQL completo e se usaste o Project URL e a chave publicável corretos.
- Se a confirmação de email estiver ativa no Supabase, confirma o email antes de iniciar sessão.
- Para alterar o URL/chave neste dispositivo, entra na página de autenticação e escolhe `Alterar configuração`.
