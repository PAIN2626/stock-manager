-- Stock Manager: atualização para preço de venda e tamanhos.
-- Executa este SQL UMA VEZ no Supabase > SQL Editor > New query.
-- Não apaga nem altera os artigos/quantidades já existentes.
alter table public.products
  add column if not exists sale_price numeric(10,2) not null default 0;

alter table public.products
  add column if not exists size text;

-- Os artigos já existentes ficam com preço de venda 0,00 € até serem editados.
