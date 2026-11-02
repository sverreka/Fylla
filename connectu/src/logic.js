import { PREFERENCES, LIFESTYLE } from './data.js';

const KEY = 'connectu.v1';

export function load() {
  try {
    const raw = window.localStorage.getItem(KEY);
    return raw ? JSON.parse(raw) : null;
  } catch (e) {
    return null;
  }
}

export function save(state) {
  try {
    window.localStorage.setItem(KEY, JSON.stringify(state));
  } catch (e) {
    /* storage unavailable: the app keeps working in memory */
  }
}

export function clearSaved() {
  try { window.localStorage.removeItem(KEY); } catch (e) { /* ignore */ }
}

export const initialState = () => ({
  stage: 'welcome', // welcome | verify | prefs | profile | main
  me: {
    name: '', age: '', study: '', from: '', budget: 5500, moveIn: '2027-08-01', pets: false,
    hobbies: [], clean: 1, social: 1, sleep: 1, prefs: [], bio: '', email: '', verified: false,
  },
  swiped: {},      // personId -> 'like' | 'pass'
  matches: [],     // personIds, newest first
  chats: {},       // personId -> [{ from: 'me' | 'them', text, ts }]
  group: [],       // personIds in my group
  applications: {},// listingId -> { contract, ts, people }
});

const overlap = (a = [], b = []) => a.filter((x) => b.includes(x));

/** Compatibility between me and another person, 0–100, plus the top reasons. */
export function compatibility(me, p) {
  const sharedPrefs = overlap(me.prefs, p.prefs);
  const sharedHobbies = overlap(me.hobbies, p.hobbies);
  const prefScore = me.prefs.length ? sharedPrefs.length / Math.min(3, Math.max(me.prefs.length, 1)) : 0.5;
  const hobbyScore = Math.min(sharedHobbies.length / 3, 1);
  const lifeDiff = ['clean', 'social', 'sleep'].reduce((s, k) => s + Math.abs((me[k] ?? 1) - (p[k] ?? 1)), 0); // 0..6
  const lifeScore = 1 - lifeDiff / 6;
  const budgetGap = Math.abs((Number(me.budget) || 5500) - p.budget);
  const budgetScore = Math.max(0, 1 - budgetGap / 2500);
  const petsOk = me.pets === p.pets || p.prefs.includes('pets') || me.prefs.includes('pets') ? 1 : 0.4;
  const raw = 0.25 * Math.min(prefScore, 1) + 0.2 * hobbyScore + 0.35 * lifeScore + 0.12 * budgetScore + 0.08 * petsOk;
  const score = Math.round(55 + raw * 44);

  const reasons = [];
  if (me.clean === p.clean) reasons.push(`Both ${LIFESTYLE.clean.options[p.clean].toLowerCase()}`);
  if (me.sleep === p.sleep) reasons.push(`Both ${LIFESTYLE.sleep.options[p.sleep].toLowerCase()}s`.replace('flexibles', 'flexible'));
  sharedHobbies.slice(0, 2).forEach((h) => reasons.push(`Both like ${h.toLowerCase()}`));
  sharedPrefs.slice(0, 1).forEach((id) => {
    const pref = PREFERENCES.find((x) => x.id === id);
    if (pref) reasons.push(`Both want ${pref.label.toLowerCase()}`);
  });
  if (budgetGap <= 500) reasons.push('Similar budget');
  return { score: Math.min(score, 99), reasons: reasons.slice(0, 3) };
}

export const nok = (n) => `NOK ${Number(n).toLocaleString('en-US').replace(/,/g, ' ')}`;

export function formatDate(iso) {
  const d = new Date(iso + 'T12:00:00');
  if (Number.isNaN(d.getTime())) return iso;
  return d.toLocaleDateString('en-GB', { day: 'numeric', month: 'short', year: 'numeric' });
}

export function isStudentEmail(email) {
  return /^[^\s@]+@(student\.)?uia\.no$/i.test(email.trim());
}
