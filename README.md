# The Tepperman Table & Co. — Website

A single-page bakery site (plain HTML/CSS, no build step), hosted on GitHub Pages. The Special Request form emails each request to TeppermanCO.99@outlook.com using FormSubmit (free, no account).

## Files
- `index.html` — the whole site, including the Special Request form
- `logo.jpg`, `favicon.png`, `apple-touch-icon.png` — logo and icons
- `CNAME` — tells GitHub Pages your custom domain

## Still to fill in later
- Instagram / Facebook / TikTok links in the footer (currently "Coming soon")
- Online payments (Chase / Quicken), to be set up later

## 1. Put it on GitHub
1. Create a new repository (e.g. `tepperman-site`), public.
2. Upload everything in this folder to the repo root (`index.html` must be at the top level).

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

## 4. Turn on the Special Request emails (one time)
1. On the live site, fill in **Submit a Special Request** yourself and send it.
   The first time, the page will say something went wrong. That's expected: the form isn't activated yet.
2. Check the TeppermanCO.99@outlook.com inbox (and **Junk**) for an email from **FormSubmit** and click **Activate Form**.
3. Send one more test request. It should now arrive in your inbox, and customers will see a thank-you message.
4. Optional, to hide your Outlook address from the page code: FormSubmit's activation email includes a random code. In `index.html`, find `FORM_ENDPOINT` near the bottom and replace `TeppermanCO.99@outlook.com` with that code.

### Using it
- Each request arrives as an email titled **New Special Request – The Tepperman Table & Co.**, with the customer's name, email, phone, order type, date needed, quantity and details.
- Hit **Reply** to answer the customer directly.
- Tip: make an Outlook folder or rule for that subject line so requests are easy to track.
