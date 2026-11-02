import React from 'react';
import { PEOPLE, LISTINGS, PREFERENCES, HOBBIES, LIFESTYLE, REPLIES, DEMO_ME } from './data.js';
import { load, save, clearSaved, initialState, compatibility, nok, formatDate, isStudentEmail } from './logic.js';

const { useState, useEffect, useRef, useMemo, useCallback } = React;

/* ------------------------------------------------------------------ helpers */

function Avatar({ person, size = 48 }) {
  const initial = (person.name || '?').slice(0, 1).toUpperCase();
  return (
    <div className="avatar" style={{ width: size, height: size, background: person.color || '#C8603A', fontSize: size * 0.42 }} aria-hidden="true">
      {initial}
    </div>
  );
}

function Logo({ size = 28 }) {
  return (
    <div className="logo" style={{ fontSize: size }}>
      <span className="logo-mark" style={{ width: size * 1.15, height: size * 1.15 }}>
        <svg viewBox="0 0 24 24" width={size * 0.62} height={size * 0.62} aria-hidden="true">
          <path d="M12 20.5s-7.5-4.6-7.5-10.2A4.3 4.3 0 0 1 12 7.7a4.3 4.3 0 0 1 7.5 2.6c0 5.6-7.5 10.2-7.5 10.2z" fill="none" stroke="currentColor" strokeWidth="2.2" strokeLinejoin="round" />
        </svg>
      </span>
      connectU
    </div>
  );
}

function Chip({ active, onClick, children }) {
  return (
    <button type="button" className={'chip' + (active ? ' on' : '')} onClick={onClick} aria-pressed={!!active}>
      {children}
    </button>
  );
}

function Segmented({ options, value, onChange, id }) {
  return (
    <div className="seg" role="radiogroup" id={id}>
      {options.map((o, i) => (
        <button type="button" key={o} role="radio" aria-checked={value === i} className={value === i ? 'on' : ''} onClick={() => onChange(i)}>
          {o}
        </button>
      ))}
    </div>
  );
}

function Toast({ text }) {
  if (!text) return null;
  return <div className="toast" role="status">{text}</div>;
}

/* ------------------------------------------------------------------ onboarding */

function Welcome({ onStart, onDemo }) {
  return (
    <div className="screen welcome">
      <div className="welcome-top">
        <Logo size={34} />
        <h1>Find your perfect roommate match</h1>
        <p className="lead">New city. New place. New people.<br />Meet them before you move in.</p>
      </div>
      <div className="welcome-cards" aria-hidden="true">
        <div className="mini-card front"><Avatar person={PEOPLE[0]} size={52} /><b>Ingrid, 20</b><span>Nursing · 91% match</span>
          <div className="mini-actions"><span>✕</span><span className="heart">♥</span></div></div>
      </div>
      <div className="stack">
        <button className="btn primary" onClick={onStart}>Get started</button>
        <button className="btn ghost" onClick={onDemo}>Try the demo as Mari</button>
        <p className="fine">Kristiansand pilot · UiA students</p>
      </div>
    </div>
  );
}

function Verify({ me, onDone, onBack }) {
  const [email, setEmail] = useState(me.email || '');
  const [busy, setBusy] = useState(false);
  const [error, setError] = useState('');
  const submit = (e) => {
    e.preventDefault();
    if (!isStudentEmail(email)) { setError('Use your UiA address, for example name@student.uia.no.'); return; }
    setError(''); setBusy(true);
    setTimeout(() => onDone(email.trim()), 900);
  };
  return (
    <form className="screen form" onSubmit={submit}>
      <button type="button" className="back" onClick={onBack} aria-label="Back">‹</button>
      <p className="step">Step 1 of 3</p>
      <h2>Verify that you are a student</h2>
      <p className="muted">Everyone on connectU is verified, so you always know there is a real person behind a profile.</p>
      <label htmlFor="email">Student email</label>
      <input id="email" type="email" inputMode="email" autoComplete="email" placeholder="name@student.uia.no" value={email}
        onChange={(e) => setEmail(e.target.value)} aria-invalid={!!error} />
      {error && <p className="error">{error}</p>}
      <button className="btn primary" type="submit" disabled={busy}>{busy ? 'Verifying…' : 'Send verification'}</button>
      <div className="or"><span>or</span></div>
      <button type="button" className="btn bankid" disabled={busy}
        onClick={() => { setBusy(true); setTimeout(() => onDone(email.trim() || 'verified-with-bankid'), 900); }}>
        Verify with BankID
      </button>
      <p className="fine">Demo version: no real email or BankID check is made.</p>
    </form>
  );
}

function Preferences({ me, onDone, onBack, editing }) {
  const [sel, setSel] = useState(me.prefs || []);
  const toggle = (id) => setSel((s) => (s.includes(id) ? s.filter((x) => x !== id) : [...s, id]));
  return (
    <div className="screen form">
      <button type="button" className="back" onClick={onBack} aria-label="Back">‹</button>
      {!editing && <p className="step">Step 2 of 3</p>}
      <h2>What are you looking for?</h2>
      <p className="muted">Select all that apply.</p>
      <div className="pref-grid">
        {PREFERENCES.map((p) => (
          <button type="button" key={p.id} className={'pref' + (sel.includes(p.id) ? ' on' : '')} onClick={() => toggle(p.id)} aria-pressed={sel.includes(p.id)}>
            <span className="pref-icon" aria-hidden="true">{p.icon}</span>
            <b>{p.label}</b>
            <span>{p.sub}</span>
          </button>
        ))}
      </div>
      <button className="btn primary" disabled={!sel.length} onClick={() => onDone(sel)}>{editing ? 'Save' : 'Continue'}</button>
    </div>
  );
}

function ProfileForm({ me, onDone, onBack, editing }) {
  const [f, setF] = useState({ ...me });
  const set = (k, v) => setF((s) => ({ ...s, [k]: v }));
  const toggleHobby = (h) => set('hobbies', f.hobbies.includes(h) ? f.hobbies.filter((x) => x !== h) : f.hobbies.length < 6 ? [...f.hobbies, h] : f.hobbies);
  const valid = f.name.trim() && f.study.trim() && Number(f.age) >= 16 && f.hobbies.length >= 2;
  return (
    <form className="screen form" onSubmit={(e) => { e.preventDefault(); if (valid) onDone({ ...f, age: Number(f.age), budget: Number(f.budget) }); }}>
      <button type="button" className="back" onClick={onBack} aria-label="Back">‹</button>
      {!editing && <p className="step">Step 3 of 3</p>}
      <h2>{editing ? 'Edit your profile' : 'Build your profile'}</h2>
      <p className="muted">Honest profiles make better matches. Tell people how you actually live.</p>

      <div className="row2">
        <div><label htmlFor="name">First name</label><input id="name" value={f.name} onChange={(e) => set('name', e.target.value)} autoComplete="given-name" /></div>
        <div className="narrow"><label htmlFor="age">Age</label><input id="age" type="number" inputMode="numeric" min="16" max="99" value={f.age} onChange={(e) => set('age', e.target.value)} /></div>
      </div>
      <label htmlFor="study">What do you study?</label>
      <input id="study" value={f.study} placeholder="e.g. Nursing" onChange={(e) => set('study', e.target.value)} />
      <label htmlFor="from">Moving from</label>
      <input id="from" value={f.from} placeholder="e.g. Bergen" onChange={(e) => set('from', e.target.value)} />

      <h3>Living</h3>
      <label htmlFor="budget">Max rent per month: <b>{nok(f.budget)}</b></label>
      <input id="budget" type="range" min="3500" max="9000" step="100" value={f.budget} onChange={(e) => set('budget', e.target.value)} />
      <div className="row2">
        <div><label htmlFor="move">Move-in date</label><input id="move" type="date" value={f.moveIn} onChange={(e) => set('moveIn', e.target.value)} /></div>
        <div className="narrow"><label htmlFor="pets">Pets</label>
          <button type="button" id="pets" className={'toggle' + (f.pets ? ' on' : '')} onClick={() => set('pets', !f.pets)} aria-pressed={f.pets}>{f.pets ? 'I have a pet' : 'No pets'}</button></div>
      </div>

      <h3>Lifestyle</h3>
      {Object.entries(LIFESTYLE).map(([k, def]) => (
        <div key={k} className="life">
          <label htmlFor={'life-' + k}>{def.label}</label>
          <Segmented id={'life-' + k} options={def.options} value={f[k]} onChange={(v) => set(k, v)} />
        </div>
      ))}

      <h3>Hobbies <span className="muted small">(pick 2–6)</span></h3>
      <div className="chips">
        {HOBBIES.map((h) => <Chip key={h} active={f.hobbies.includes(h)} onClick={() => toggleHobby(h)}>{h}</Chip>)}
      </div>

      <label htmlFor="bio">About you</label>
      <textarea id="bio" rows="3" maxLength="160" placeholder="What would a good flatmate know about you?" value={f.bio} onChange={(e) => set('bio', e.target.value)} />

      <button className="btn primary" type="submit" disabled={!valid}>{editing ? 'Save profile' : 'Start matching'}</button>
      {!valid && <p className="fine">Add your name, age, what you study and at least two hobbies.</p>}
    </form>
  );
}

/* ------------------------------------------------------------------ discover */

function SwipeCard({ person, me, onDecide, top }) {
  const ref = useRef(null);
  const start = useRef(null);
  const [dx, setDx] = useState(0);
  const [leaving, setLeaving] = useState(0);
  const { score, reasons } = useMemo(() => compatibility(me, person), [me, person]);

  const finish = (dir) => {
    setLeaving(dir);
    setTimeout(() => onDecide(person, dir > 0 ? 'like' : 'pass'), 220);
  };
  useEffect(() => {
    if (!top) return undefined;
    const onKey = (e) => {
      if (e.key === 'ArrowRight') finish(1);
      if (e.key === 'ArrowLeft') finish(-1);
    };
    window.addEventListener('keydown', onKey);
    return () => window.removeEventListener('keydown', onKey);
  });

  const down = (e) => {
    if (!top || leaving) return;
    start.current = e.clientX;
    try { ref.current.setPointerCapture(e.pointerId); } catch (err) { /* ignore */ }
  };
  const move = (e) => { if (start.current !== null) setDx(e.clientX - start.current); };
  const up = () => {
    if (start.current === null) return;
    start.current = null;
    if (dx > 110) finish(1); else if (dx < -110) finish(-1); else setDx(0);
  };

  const x = leaving ? leaving * 520 : dx;
  const style = { transform: `translateX(${x}px) rotate(${x / 18}deg)`, transition: start.current !== null ? 'none' : 'transform .25s ease' };
  return (
    <div className={'card' + (top ? ' top' : ' under')} ref={ref} style={top ? style : undefined}
      onPointerDown={down} onPointerMove={move} onPointerUp={up} onPointerCancel={up}>
      <div className="card-hero" style={{ background: person.color }}>
        <div className="stamp like" style={{ opacity: Math.max(0, Math.min(1, x / 110)) }}>YES</div>
        <div className="stamp nope" style={{ opacity: Math.max(0, Math.min(1, -x / 110)) }}>PASS</div>
        <div className="hero-avatar" aria-hidden="true">{person.name[0]}</div>
        <div className="hero-text">
          <h2>{person.name}, {person.age}</h2>
          <p>{person.study} · from {person.from}</p>
        </div>
        <span className="score">{score}% match</span>
      </div>
      <div className="card-body">
        <p className="bio">{person.bio}</p>
        {reasons.length > 0 && <div className="reasons">{reasons.map((r) => <span key={r}>✓ {r}</span>)}</div>}
        <dl className="facts">
          <div><dt>Budget</dt><dd>{nok(person.budget)}</dd></div>
          <div><dt>Move-in</dt><dd>{formatDate(person.moveIn)}</dd></div>
          <div><dt>Home</dt><dd>{LIFESTYLE.clean.options[person.clean]} · {LIFESTYLE.social.options[person.social]}</dd></div>
          <div><dt>Pets</dt><dd>{person.pets ? 'Has a pet' : 'No pets'}</dd></div>
        </dl>
        <div className="chips static">{person.hobbies.map((h) => <span className="chip" key={h}>{h}</span>)}</div>
        <p className="verified">✓ Verified UiA student</p>
      </div>
    </div>
  );
}

function Discover({ state, onDecide, onReset }) {
  const queue = PEOPLE.filter((p) => !state.swiped[p.id]);
  const [topRef, setTopRef] = useState(0);
  const top = queue[0];
  const next = queue[1];
  return (
    <div className="discover">
      <div className="deck" key={topRef}>
        {next && <SwipeCard key={next.id} person={next} me={state.me} onDecide={() => {}} top={false} />}
        {top ? (
          <SwipeCard key={top.id} person={top} me={state.me} top onDecide={(p, d) => { onDecide(p, d); setTopRef((n) => n + 1); }} />
        ) : (
          <div className="empty">
            <div className="empty-mark">♥</div>
            <h2>You have seen everyone for now</h2>
            <p className="muted">New students join every week before semester start. Check your matches or browse homes.</p>
            <button className="btn ghost" onClick={onReset}>Start the deck again</button>
          </div>
        )}
      </div>
      {top && (
        <div className="actions">
          <button className="round pass" aria-label={`Pass on ${top.name}`} onClick={() => onDecide(top, 'pass')}>✕</button>
          <p className="hint">A chat opens only when you both say yes</p>
          <button className="round like" aria-label={`Say yes to ${top.name}`} onClick={() => onDecide(top, 'like')}>♥</button>
        </div>
      )}
    </div>
  );
}

function MatchOverlay({ me, person, onChat, onClose }) {
  return (
    <div className="overlay" role="dialog" aria-modal="true" aria-label="It's a match">
      <div className="match-box">
        <p className="eyebrow">Mutual match</p>
        <h2>You and {person.name} both said yes</h2>
        <div className="pair">
          <Avatar person={{ name: me.name, color: '#4A1D0E' }} size={84} />
          <span className="pair-heart">♥</span>
          <Avatar person={person} size={84} />
        </div>
        <p className="muted">{compatibility(me, person).reasons.join(' · ')}</p>
        <button className="btn primary" onClick={onChat}>Send {person.name} a message</button>
        <button className="btn ghost light" onClick={onClose}>Keep swiping</button>
      </div>
    </div>
  );
}

/* ------------------------------------------------------------------ matches + chat */

function Matches({ state, openChat, toggleGroup, goHomes }) {
  const people = state.matches.map((id) => PEOPLE.find((p) => p.id === id)).filter(Boolean);
  const liked = PEOPLE.filter((p) => state.swiped[p.id] === 'like' && !state.matches.includes(p.id));
  return (
    <div className="page">
      <h1 className="page-title">Matches</h1>
      {people.length === 0 ? (
        <div className="empty small"><p className="muted">No matches yet. When someone you said yes to says yes back, they appear here.</p></div>
      ) : (
        <>
          <ul className="list">
            {people.map((p) => {
              const msgs = state.chats[p.id] || [];
              const last = msgs[msgs.length - 1];
              const inGroup = state.group.includes(p.id);
              return (
                <li key={p.id} className="match-row">
                  <button className="match-main" onClick={() => openChat(p.id)}>
                    <Avatar person={p} size={52} />
                    <span className="match-text">
                      <b>{p.name}, {p.age}</b>
                      <span className="muted">{last ? (last.from === 'me' ? 'You: ' : '') + last.text : `${compatibility(state.me, p).score}% match · say hi`}</span>
                    </span>
                  </button>
                  <button className={'group-btn' + (inGroup ? ' on' : '')} onClick={() => toggleGroup(p.id)} aria-pressed={inGroup}>
                    {inGroup ? 'In group' : '+ Group'}
                  </button>
                </li>
              );
            })}
          </ul>
          <div className="group-card">
            <div>
              <p className="eyebrow">Your group</p>
              <b>{[state.me.name || 'You', ...state.group.map((id) => PEOPLE.find((p) => p.id === id)?.name)].join(', ')}</b>
              <p className="muted small">{state.group.length ? `${state.group.length + 1} people · apply together for a home` : 'Add matches to apply for a home together'}</p>
            </div>
            <button className="btn small" disabled={!state.group.length} onClick={goHomes}>Find homes</button>
          </div>
        </>
      )}
      {liked.length > 0 && (
        <>
          <h3 className="section">Waiting for an answer</h3>
          <div className="waiting">
            {liked.map((p) => <div key={p.id} className="wait"><Avatar person={p} size={44} /><span>{p.name}</span></div>)}
          </div>
          <p className="fine">They can only message you if they say yes too.</p>
        </>
      )}
    </div>
  );
}

function Chat({ state, personId, onSend, onBack }) {
  const p = PEOPLE.find((x) => x.id === personId);
  const msgs = state.chats[personId] || [];
  const [text, setText] = useState('');
  const endRef = useRef(null);
  useEffect(() => { endRef.current?.scrollIntoView({ block: 'end' }); }, [msgs.length]);
  const { reasons } = compatibility(state.me, p);
  return (
    <div className="chat">
      <header className="chat-head">
        <button className="back inline" onClick={onBack} aria-label="Back to matches">‹</button>
        <Avatar person={p} size={40} />
        <div><b>{p.name}</b><span className="muted small">✓ Verified · {p.study}</span></div>
      </header>
      <div className="chat-body">
        <div className="chat-intro">
          <p>You matched with {p.name}</p>
          <span>{reasons.join(' · ')}</span>
        </div>
        {msgs.map((m, i) => <div key={i} className={'bubble ' + m.from}>{m.text}</div>)}
        <div ref={endRef} />
      </div>
      <form className="chat-input" onSubmit={(e) => { e.preventDefault(); if (text.trim()) { onSend(personId, text.trim()); setText(''); } }}>
        <input id="chat-text" value={text} onChange={(e) => setText(e.target.value)} placeholder={`Message ${p.name}`} autoComplete="off" />
        <button className="send" type="submit" disabled={!text.trim()} aria-label="Send">➤</button>
      </form>
    </div>
  );
}

/* ------------------------------------------------------------------ homes */

function ApplySheet({ listing, people, me, onConfirm, onClose }) {
  const [contract, setContract] = useState('individual');
  return (
    <div className="overlay sheet-wrap" role="dialog" aria-modal="true" aria-label="Apply as a group">
      <div className="sheet">
        <div className="grab" />
        <h2>Apply for {listing.title.toLowerCase()}</h2>
        <p className="muted">{[me.name || 'You', ...people.map((p) => p.name)].join(', ')} · {listing.area}</p>
        <h3>Choose a contract type</h3>
        <button type="button" className={'contract' + (contract === 'individual' ? ' on' : '')} onClick={() => setContract('individual')}>
          <b>Individual contracts <span className="tag">Recommended</span></b>
          <span>Each person signs for their own room and pays only their own rent.</span>
        </button>
        <button type="button" className={'contract' + (contract === 'joint' ? ' on' : '')} onClick={() => setContract('joint')}>
          <b>One shared contract</b>
          <span>Joint liability: the landlord can ask any one of you for the full rent if someone does not pay.</span>
        </button>
        <p className="fine">Under Norwegian rules, tenants on one shared contract are jointly liable unless something else is agreed (Husleietvistutvalget).</p>
        <button className="btn primary" onClick={() => onConfirm(contract)}>Send group application</button>
        <button className="btn ghost" onClick={onClose}>Cancel</button>
      </div>
    </div>
  );
}

function Homes({ state, onApply, goMatches }) {
  const [sheet, setSheet] = useState(null);
  const groupPeople = state.group.map((id) => PEOPLE.find((p) => p.id === id)).filter(Boolean);
  const size = groupPeople.length + 1;
  const sorted = [...LISTINGS].sort((a, b) => (b.featured - a.featured) || a.minutes - b.minutes);
  return (
    <div className="page">
      <h1 className="page-title">Homes</h1>
      <p className="muted">Homes in Kristiansand with several empty rooms, from landlords looking for a ready group.</p>
      <div className="group-strip">
        <span>Your group: <b>{size} {size === 1 ? 'person' : 'people'}</b></span>
        <button className="link" onClick={goMatches}>{groupPeople.length ? 'Edit group' : 'Add matches'}</button>
      </div>
      <ul className="homes">
        {sorted.map((l) => {
          const applied = state.applications[l.id];
          const fits = size >= 2 && size <= l.rooms;
          return (
            <li key={l.id} className="home">
              <div className="home-img" style={{ background: `linear-gradient(135deg, ${l.featured ? '#C8603A' : '#E3A58C'}, #4A1D0E)` }}>
                {l.featured && <span className="featured">Featured</span>}
                <span className="rooms">{l.rooms} rooms free</span>
              </div>
              <div className="home-body">
                <b>{l.title}</b>
                <span className="muted small">{l.area} · {l.minutes} min to UiA · from {formatDate(l.move)}</span>
                <div className="home-tags">
                  <span>{nok(l.rent)} / room</span>
                  {l.furnished && <span>Furnished</span>}
                  {l.pets && <span>Pets allowed</span>}
                  <span>{l.landlord}</span>
                </div>
                {applied ? (
                  <p className="applied">✓ Application sent · {applied.contract === 'individual' ? 'individual contracts' : 'shared contract'}</p>
                ) : (
                  <button className="btn small primary" disabled={!fits} onClick={() => setSheet(l)}>
                    {fits ? `Apply as a group of ${size}` : size < 2 ? 'Form a group to apply' : `Group too big for ${l.rooms} rooms`}
                  </button>
                )}
              </div>
            </li>
          );
        })}
      </ul>
      <p className="fine">Example listings for the demo.</p>
      {sheet && (
        <ApplySheet listing={sheet} people={groupPeople} me={state.me} onClose={() => setSheet(null)}
          onConfirm={(contract) => { onApply(sheet.id, contract); setSheet(null); }} />
      )}
    </div>
  );
}

/* ------------------------------------------------------------------ me */

function Me({ state, onEditProfile, onEditPrefs, onReset }) {
  const me = state.me;
  const [confirm, setConfirm] = useState(false);
  return (
    <div className="page">
      <h1 className="page-title">Me</h1>
      <div className="me-card">
        <Avatar person={{ name: me.name, color: '#4A1D0E' }} size={72} />
        <div>
          <h2>{me.name}, {me.age}</h2>
          <p className="muted">{me.study}{me.from ? ` · from ${me.from}` : ''}</p>
          <p className="verified">✓ {me.verified ? 'Verified student' : 'Not verified'}</p>
        </div>
      </div>
      {me.bio && <p className="bio">{me.bio}</p>}
      <dl className="facts">
        <div><dt>Budget</dt><dd>{nok(me.budget)}</dd></div>
        <div><dt>Move-in</dt><dd>{formatDate(me.moveIn)}</dd></div>
        <div><dt>Home</dt><dd>{LIFESTYLE.clean.options[me.clean]} · {LIFESTYLE.social.options[me.social]}</dd></div>
        <div><dt>Rhythm</dt><dd>{LIFESTYLE.sleep.options[me.sleep]}</dd></div>
      </dl>
      <div className="chips static">{me.hobbies.map((h) => <span className="chip" key={h}>{h}</span>)}</div>
      <div className="stack top">
        <button className="btn ghost" onClick={onEditProfile}>Edit profile</button>
        <button className="btn ghost" onClick={onEditPrefs}>Edit what I am looking for</button>
        {confirm ? (
          <div className="confirm">
            <p>Delete your profile, matches and chats from this device?</p>
            <div className="row2"><button className="btn danger" onClick={onReset}>Delete</button><button className="btn ghost" onClick={() => setConfirm(false)}>Keep</button></div>
          </div>
        ) : (
          <button className="btn link-danger" onClick={() => setConfirm(true)}>Reset demo</button>
        )}
      </div>
      <p className="fine">connectU MVP · demo data · your data stays on this device.</p>
    </div>
  );
}

/* ------------------------------------------------------------------ app */

const TABS = [
  { id: 'discover', label: 'Discover', icon: '♥' },
  { id: 'matches', label: 'Matches', icon: '✉' },
  { id: 'homes', label: 'Homes', icon: '⌂' },
  { id: 'me', label: 'Me', icon: '●' },
];

export default function App() {
  const [state, setState] = useState(() => load() || initialState());
  const [tab, setTab] = useState('discover');
  const [chatWith, setChatWith] = useState(null);
  const [matchWith, setMatchWith] = useState(null);
  const [edit, setEdit] = useState(null); // 'profile' | 'prefs'
  const [toast, setToast] = useState('');
  const timers = useRef([]);

  useEffect(() => { save(state); }, [state]);
  useEffect(() => () => timers.current.forEach(clearTimeout), []);

  const flash = useCallback((t) => {
    setToast(t);
    timers.current.push(setTimeout(() => setToast(''), 2600));
  }, []);
  const update = (fn) => setState((s) => fn(s));

  const decide = (person, choice) => {
    update((s) => {
      const swiped = { ...s.swiped, [person.id]: choice };
      const isMatch = choice === 'like' && person.likesYou && !s.matches.includes(person.id);
      return { ...s, swiped, matches: isMatch ? [person.id, ...s.matches] : s.matches };
    });
    if (choice === 'like') {
      if (person.likesYou) setMatchWith(person);
      else flash(`You said yes to ${person.name}. You match if ${person.name} says yes too.`);
    }
  };

  const send = (id, text) => {
    update((s) => ({ ...s, chats: { ...s.chats, [id]: [...(s.chats[id] || []), { from: 'me', text, ts: Date.now() }] } }));
    const lines = REPLIES[id] || ['Nice to meet you!'];
    timers.current.push(setTimeout(() => {
      update((s) => {
        const mine = (s.chats[id] || []).filter((m) => m.from === 'them').length;
        if (mine >= lines.length) return s;
        return { ...s, chats: { ...s.chats, [id]: [...(s.chats[id] || []), { from: 'them', text: lines[mine], ts: Date.now() }] } };
      });
    }, 1300));
  };

  const toggleGroup = (id) => update((s) => ({ ...s, group: s.group.includes(id) ? s.group.filter((x) => x !== id) : s.group.length >= 4 ? s.group : [...s.group, id] }));
  const apply = (listingId, contract) => {
    update((s) => ({ ...s, applications: { ...s.applications, [listingId]: { contract, ts: Date.now(), people: s.group } } }));
    flash('Application sent. The landlord gets one complete group, not single applicants.');
  };
  const reset = () => { clearSaved(); setState(initialState()); setTab('discover'); setChatWith(null); };

  let content;
  if (state.stage === 'welcome') {
    content = <Welcome onStart={() => update((s) => ({ ...s, stage: 'verify' }))}
      onDemo={() => update((s) => ({ ...s, me: { ...DEMO_ME }, stage: 'main' }))} />;
  } else if (state.stage === 'verify') {
    content = <Verify me={state.me} onBack={() => update((s) => ({ ...s, stage: 'welcome' }))}
      onDone={(email) => update((s) => ({ ...s, me: { ...s.me, email, verified: true }, stage: 'prefs' }))} />;
  } else if (state.stage === 'prefs') {
    content = <Preferences me={state.me} onBack={() => update((s) => ({ ...s, stage: 'verify' }))}
      onDone={(prefs) => update((s) => ({ ...s, me: { ...s.me, prefs }, stage: 'profile' }))} />;
  } else if (state.stage === 'profile') {
    content = <ProfileForm me={state.me} onBack={() => update((s) => ({ ...s, stage: 'prefs' }))}
      onDone={(me) => update((s) => ({ ...s, me: { ...s.me, ...me }, stage: 'main' }))} />;
  } else if (edit === 'profile') {
    content = <ProfileForm me={state.me} editing onBack={() => setEdit(null)} onDone={(me) => { update((s) => ({ ...s, me: { ...s.me, ...me } })); setEdit(null); flash('Profile saved'); }} />;
  } else if (edit === 'prefs') {
    content = <Preferences me={state.me} editing onBack={() => setEdit(null)} onDone={(prefs) => { update((s) => ({ ...s, me: { ...s.me, prefs } })); setEdit(null); flash('Saved'); }} />;
  } else if (chatWith) {
    content = <Chat state={state} personId={chatWith} onSend={send} onBack={() => setChatWith(null)} />;
  } else {
    content = (
      <>
        <header className="topbar"><Logo size={22} /><span className="pill">Kristiansand</span></header>
        <main className="tab-content">
          {tab === 'discover' && <Discover state={state} onDecide={decide} onReset={() => update((s) => ({ ...s, swiped: Object.fromEntries(Object.entries(s.swiped).filter(([id]) => s.matches.includes(id))) }))} />}
          {tab === 'matches' && <Matches state={state} openChat={setChatWith} toggleGroup={toggleGroup} goHomes={() => setTab('homes')} />}
          {tab === 'homes' && <Homes state={state} onApply={apply} goMatches={() => setTab('matches')} />}
          {tab === 'me' && <Me state={state} onEditProfile={() => setEdit('profile')} onEditPrefs={() => setEdit('prefs')} onReset={reset} />}
        </main>
        <nav className="tabbar" aria-label="Main">
          {TABS.map((t) => (
            <button key={t.id} className={tab === t.id ? 'on' : ''} onClick={() => setTab(t.id)} aria-current={tab === t.id ? 'page' : undefined}>
              <span className="tab-icon" aria-hidden="true">{t.icon}</span>
              {t.label}
              {t.id === 'matches' && state.matches.length > 0 && <span className="badge">{state.matches.length}</span>}
            </button>
          ))}
        </nav>
      </>
    );
  }

  return (
    <div className="phone">
      {content}
      {matchWith && (
        <MatchOverlay me={state.me} person={matchWith}
          onChat={() => { setChatWith(matchWith.id); setMatchWith(null); }}
          onClose={() => setMatchWith(null)} />
      )}
      <Toast text={toast} />
    </div>
  );
}
