# The Tepperman Table & Co. — Website

A single-page bakery site (plain HTML/CSS, no build step), hosted on GitHub Pages. The Special Request form emails each request to TeppermanCO.99@outlook.com using FormSubmit (free, no account).

## Files
- `index.html` — the whole site, including the Special Request form
- `order.html` — your order builder (not linked from the site): build an order, then email it to the customer
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
   The first time, FormSubmit shows a page saying the form needs activation. That's expected.
2. Check the TeppermanCO.99@outlook.com inbox (and **Junk**) for an email from **FormSubmit** and click **Activate Form**.
3. Send one more test request using a different email address you can check. You should get the request in Outlook, and that address should get a confirmation copy.
4. Optional, to hide your Outlook address from the page code: the activation email includes a random code. In `index.html`, find `action="https://formsubmit.co/TeppermanCO.99@outlook.com"` and replace the email with that code.

### Order Online
- The **Place an Order** section lets customers pick menu items with + / − buttons, see an estimated total, choose pickup or delivery and a date, and send the order.
- You get an email titled **New Online Order – The Tepperman Table & Co.** listing every item, quantity and the estimated total. The customer gets a copy automatically.
- Items without a set price show "Priced by email"; confirm the final total when you reply.
- Menu items and prices for this section are in `OO_MENU` near the bottom of `index.html`. Keep them in sync with the menu.

### How requests work
- The customer clicks **Send Request**, ticks FormSubmit's "I'm not a robot" check, and lands back on your site with a thank-you message.
- You get an email titled **New Special Request – The Tepperman Table & Co.** with all their details. Hit **Reply** to answer them.
- The customer automatically gets a confirmation email with a copy of what they sent.

## 5. Create and email an order (`order.html`)
Open `https://www.theteppermantableandco.com/order.html` (bookmark it).
1. Enter the customer's name and email. The order number fills in automatically.
2. Choose pickup or delivery, the date and time.
3. Add items from the menu. Prices fill in; type a price for "Email for pricing" items. Use **Special / custom item** for anything else.
4. Add a delivery fee or deposit if needed. The total and balance due update as you go.
5. Click **Email to Customer**. Your email app opens with the completed order written out. Review it and hit **Send**.
   If your email app doesn't open (for example, if you use Outlook in a browser), click **Copy Text** and paste it into a new email.
- **Print** gives you a paper copy of the order for the kitchen.
- Your work saves automatically in that browser until you click **Start New Order**.
- If you change the menu on the site, tell Claude (or edit the `MENU` list near the bottom of `order.html`) so the builder matches.
