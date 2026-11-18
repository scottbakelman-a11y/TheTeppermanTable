# The Tepperman Table & Co. — Website

A bakery site (plain HTML/CSS, no build step), hosted on GitHub Pages, with a Special Request form and a private admin page backed by Supabase (free).

## Files
- `index.html` — the public site, including the Special Request form
- `admin.html` — private admin page: sign in to see and manage requests
- `config.js` — your Supabase connection (paste 2 values, see step 4)
- `supabase-setup.sql` — creates the orders database and its security rules (run once in Supabase)
- `logo.jpg`, `favicon.png`, `apple-touch-icon.png` — logo and icons
- `CNAME` — tells GitHub Pages your custom domain

## Still to fill in later
- Instagram / Facebook / TikTok links in the footer (currently "Coming soon")
- Online payments (Chase / Quicken), to be set up later

## 1. Put it on GitHub
1. Create a new repository (e.g. `tepperman-site`), public.
2. Upload everything in this folder to the repo root (`index.html`, `admin.html` and `config.js` must be at the top level). `supabase-setup.sql` and this README contain nothing secret, so uploading them is fine.

## 2. Turn on GitHub Pages
Repo → **Settings → Pages** → Source: **Deploy from a branch** → Branch: `main`, folder `/ (root)` → Save.

## 3. Connect your Wix domain
1. `CNAME` already contains `www.theteppermantableandco.com`.
2. In Wix: **Domains → your domain → Manage DNS Records**, then:
   - **A records** for the root (`@` / blank host): remove Wix's existing A records and add all four:
     `185.199.108.153`, `185.199.109.153`, `185.199.110.153`, `185.199.111.153`
   - **CNAME** for `www`: point to `<your-username>.github.io`
3. Back in GitHub → **Settings → Pages → Custom domain**: enter the same domain, Save.
   Once the DNS check passes (minutes to a few hours), tick **Enforce HTTPS**.

Note: leave the MX (email) records in Wix untouched if you use email on this domain.

## 4. Set up the order database (Supabase, free)
1. Sign up at **supabase.com** and create a **New project** (any name, e.g. `tepperman`; save the database password somewhere safe).
2. When it's ready, open **SQL Editor → New query**, paste in all of `supabase-setup.sql`, and click **Run**.
3. **Create your admin login:** **Authentication → Users → Add user → Create new user**.
   Email: `TeppermanCO.99@outlook.com`, choose a password, tick **Auto Confirm User**.
4. **Turn off public sign-ups:** in **Authentication** settings, turn off **Allow new users to sign up**.
5. **Let password-reset links come back to your site:** **Authentication → URL Configuration** → set **Site URL** to `https://www.theteppermantableandco.com` and add `https://www.theteppermantableandco.com/admin.html` under **Redirect URLs**.
6. **Copy your keys:** **Project Settings → API** (or the **Connect** button). Copy the **Project URL** and the **anon / publishable** key into `config.js`. Never put the `service_role` / secret key on the site.
7. Upload the updated `config.js` to GitHub.

### Using it
- Customers fill in **Submit a Special Request** on the site; it lands as **Pending**.
- Go to `https://www.theteppermantableandco.com/admin.html`, sign in, and you'll see Pending requests first, sorted by the date they're needed.
- Change a request's status (Pending → Confirmed → Done, or Cancelled) and keep private notes (price quoted, paid, pickup time).
- Click a customer's email to reply.
- To add another admin: create their user as in step 3, then run in the SQL Editor:
  `insert into public.admins (email) values ('their@email.com');` (use all lowercase)

The site doesn't email you when a new request comes in; check the admin page.
