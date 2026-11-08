-- Executa este ficheiro no SQL Editor do teu projeto Supabase.
-- As políticas garantem que cada conta só vê e altera os seus próprios artigos/categorias.

create table if not exists public.categories (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  name text not null,
  created_at timestamptz not null default now(),
  unique(user_id, name)
);

create table if not exists public.products (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  category_id uuid not null references public.categories(id) on delete restrict,
  name text not null,
  sku text,
  quantity integer not null default 0 check (quantity >= 0),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index if not exists products_user_id_idx on public.products(user_id);
create index if not exists products_category_id_idx on public.products(category_id);

alter table public.categories enable row level security;
alter table public.products enable row level security;

drop policy if exists "Users manage own categories" on public.categories;
create policy "Users manage own categories" on public.categories
for all to authenticated
using (auth.uid() = user_id)
with check (auth.uid() = user_id);

drop policy if exists "Users manage own products" on public.products;
create policy "Users manage own products" on public.products
for all to authenticated
using (auth.uid() = user_id)
with check (auth.uid() = user_id);

-- Ativar Realtime para sincronização instantânea entre dispositivos.
do $$ begin
  alter publication supabase_realtime add table public.products;
exception when duplicate_object then null;
end $$;

do $$ begin
  alter publication supabase_realtime add table public.categories;
exception when duplicate_object then null;
end $$;