# connectU – MVP app

Swipe to match with compatible roommates. One codebase for **web, iOS and Android**:
the app is written in React and packaged for the phones with [Capacitor](https://capacitorjs.com).

## What is in the MVP

| Step | Screen | What it does |
| --- | --- | --- |
| 1 | Verify | Student email (`@student.uia.no`) or BankID button – **simulated in the demo** |
| 2 | Preferences | Short/long term, student housing, co-living, furnished, pets, centre, budget |
| 3 | Profile | Name, study, budget (NOK), move-in date, pets, lifestyle (cleanliness, social, rhythm), hobbies, bio |
| 4 | Discover | Swipe cards with a compatibility % and the reasons ("Both very tidy"). Drag, tap the buttons or use ← → |
| 5 | Mutual match | A chat opens **only when both people say yes** – the core idea of connectU |
| 6 | Chat | Message your matches (demo profiles reply automatically) |
| 7 | Group | Add matches to a group |
| 8 | Homes | Landlord listings with several empty rooms; **featured listings** (the NOK 149 product) are shown first; apply as a group and choose individual or shared contract (joint-liability guidance) |
| 9 | Me | Your profile, edit, reset demo |

All people and homes are fictional demo data (`src/data.js`). Data is stored only on the device (localStorage).

## Run it on your computer (web)

Requires [Node.js 18+](https://nodejs.org).

```bash
npm install
npm start          # builds www/index.html and serves it on http://localhost:3000
```

Open the address on your phone (same Wi-Fi, use your computer's IP) and choose **Add to Home Screen** to use it like an app.

## Build the iPhone app (needs a Mac with Xcode)

```bash
npm install
npx cap add ios    # first time only – creates the ios/ project
npm run ios        # builds, copies into the iOS project and opens Xcode
```

In Xcode: pick your team under *Signing & Capabilities*, choose a simulator or your iPhone, press ▶.
To publish on the App Store you need an Apple Developer account (99 USD per year).

## Build the Android app (needs Android Studio)

```bash
npm install
npx cap add android   # first time only – creates the android/ project
npm run android       # builds, copies into the Android project and opens Android Studio
```

Press ▶ to run on an emulator or a phone with USB debugging. Google Play needs a developer account (25 USD one-time).

## Project layout

```
src/App.jsx      all screens
src/data.js      demo profiles, listings, preferences, hobbies
src/logic.js     compatibility score, storage, formatting
src/styles.css   connectU design (colours from the pitch deck)
build.mjs        bundles everything into www/index.html with esbuild
capacitor.config.json   app id no.connectu.app, name connectU
```

## Next steps toward a real product

1. **Backend + accounts** – e.g. Supabase or Firebase for users, likes, matches and chat in real time (today everything is local demo data).
2. **Real verification** – UiA student email with a one-time code; BankID through a provider such as Signicat or Criipto (requires an agreement).
3. **Landlord side** – landlord login to post listings and pay for featured listings (Stripe or Vipps).
4. **Safety** – report/block, moderation, privacy policy and GDPR consent before collecting real data.
5. **Pilot metrics** – reply rate after a mutual match vs. cold messages, matches → shared flat, paying landlords.
