# The Tepperman Table & Co. — Website

A single-page bakery site (plain HTML/CSS, no build step), hosted on GitHub Pages.

## Files
- `index.html` — the whole site
- `assets/logo.jpg`, `assets/favicon.png`, `assets/apple-touch-icon.png` — logo and icons
- `CNAME` — tells GitHub Pages your custom domain (edit it, see step 3)

## Before launch: replace the placeholders
Search `index.html` for these and swap in the real details:
- Menu items and prices (the "sample" note under the menu can then be deleted)
- Address `123 Main Street, Your Town, TX 75000` and the Google Maps link
- Phone `(555) 555-5555` / `+15555555555`
- Email `hello@theteppermantableandco.com`
- Hours
- Instagram / Facebook links in the footer

## 1. Put it on GitHub
1. Create a new repository (e.g. `tepperman-site`), public.
2. Upload everything in this folder to the repo root (`index.html` must be at the top level).

## 2. Turn on GitHub Pages
Repo → **Settings → Pages** → Source: **Deploy from a branch** → Branch: `main`, folder `/ (root)` → Save.
In a minute the site is live at `https://<your-username>.github.io/tepperman-site/`.

## 3. Connect your Wix domain
1. Open `CNAME` and replace `www.yourdomain.com` with your real domain (already set to `www.theteppermantableandco.com`). Commit.
2. In Wix: **Domains → your domain → Manage DNS Records**, then:
   - **A records** for the root (`@` / blank host): remove Wix's existing A records and add all four:
     `185.199.108.153`, `185.199.109.153`, `185.199.110.153`, `185.199.111.153`
   - **CNAME** for `www`: point to `<your-username>.github.io`
3. Back in GitHub → **Settings → Pages → Custom domain**: enter the same domain, Save.
   Once the DNS check passes (minutes to a few hours), tick **Enforce HTTPS**.

Note: pointing the domain at GitHub means it will no longer show a Wix site. Leave the MX (email) records in Wix untouched if you use email on this domain.
