# Teach Me Academy - Mobile PWA Shell

Lightweight Progressive Web App (PWA) wrapper that turns the 24/7 Google Apps Script Teach Me Academy into a native-feeling Android mobile app.

---

## 📱 How It Works
* **Real WebAPK**: Meets 100% of Google Chrome's PWA install criteria (manifest + active service worker + HTTPS).
* **Standalone UI**: Removes the browser URL bar, navigation buttons, and the Chrome badge icon.
* **Auto-Syncing**: Always loads the live Google Apps Script deployment (`/exec`). Every lesson or track update pushed via `clasp push` is immediately reflected without touching this wrapper.
* **Query Parameter Forwarding**: Supports deep links like `?track=voice-agents&lesson=lesson_voice_01`.

---

## 🚀 2-Minute Deployment Options

### Option A: Cloudflare Pages (Easiest - Drag & Drop, No Terminal)
1. Go to **[Cloudflare Dashboard](https://dash.cloudflare.com/)** -> **Workers & Pages**.
2. Click **Create application** -> **Pages** -> **Upload assets**.
3. Name your project (e.g. `teach-academy`).
4. Drag and drop this folder (`c:\Users\nickb\AGY coding projects\Google Clasp API\teach-me-academy-pwa`) into the upload box.
5. Click **Deploy site**.
6. Cloudflare will give you an instant HTTPS URL (e.g., `https://teach-academy.pages.dev`).

### Option B: GitHub Pages (Free Cloud Git Hosting)
1. Create a new GitHub repository (e.g. `teach-academy`).
2. Push the files in this folder to the `main` branch.
3. In your repo: **Settings** -> **Pages** -> Set Source to **Deploy from a branch** (`main` / `root`) -> **Save**.
4. Your PWA will be live at: `https://<your-username>.github.io/teach-academy/`.

---

## 📲 Installing on Your Android Phone
1. Open your live URL (from Cloudflare Pages or GitHub Pages) in **Chrome on your Android phone**.
2. Tap the **three dots menu (⋮)** in the top right.
3. You will now see **Install app** (or **Install Teach Me Academy**).
4. Tap **Install**.
5. The app will install directly into your **Android App Drawer** and home screen as a standalone app with the Teach Me Academy icon and splash screen.
