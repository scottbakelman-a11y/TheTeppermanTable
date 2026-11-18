-- The Tepperman Table & Co. — order requests database
-- Paste this whole file into Supabase → SQL Editor → New query → Run. Run it once.

-- 1. Orders table
create table if not exists public.orders (
  id           bigint generated always as identity primary key,
  created_at   timestamptz not null default now(),
  name         text not null check (char_length(name) between 1 and 120),
  email        text not null check (char_length(email) between 3 and 200),
  phone        text check (char_length(phone) <= 40),
  category     text not null check (category in ('Breads','Cookies','Cakes','Pies','Something else')),
  date_needed  date not null,
  quantity     text not null check (char_length(quantity) between 1 and 200),
  details      text not null check (char_length(details) between 1 and 4000),
  status       text not null default 'Pending' check (status in ('Pending','Confirmed','Done','Cancelled')),
  admin_notes  text
);

-- 2. Who counts as an admin (add more emails later with another insert)
create table if not exists public.admins (
  email text primary key
);
insert into public.admins (email) values ('teppermanco.99@outlook.com')
  on conflict do nothing;

create or replace function public.is_admin()
returns boolean language sql stable security definer set search_path = public as $$
  select exists (select 1 from public.admins where email = lower(auth.jwt() ->> 'email'));
$$;

-- 3. Security rules
alter table public.orders enable row level security;
alter table public.admins enable row level security;

-- The public website may ONLY add new requests, and only as "Pending".
-- It cannot read, change or delete anything.
drop policy if exists "public can submit requests" on public.orders;
create policy "public can submit requests" on public.orders
  for insert to anon
  with check (status = 'Pending' and admin_notes is null);

-- Only admins (signed in) can see and update orders.
drop policy if exists "admins read orders" on public.orders;
create policy "admins read orders" on public.orders
  for select to authenticated using (public.is_admin());

drop policy if exists "admins update orders" on public.orders;
create policy "admins update orders" on public.orders
  for update to authenticated using (public.is_admin()) with check (public.is_admin());

drop policy if exists "admins delete orders" on public.orders;
create policy "admins delete orders" on public.orders
  for delete to authenticated using (public.is_admin());

-- Column-level lock: the public can only fill in the customer fields.
revoke all on public.orders from anon;
grant insert (name, email, phone, category, date_needed, quantity, details) on public.orders to anon;
grant select, update, delete on public.orders to authenticated;
revoke all on public.admins from anon, authenticated;
