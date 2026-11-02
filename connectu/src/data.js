// Demo data for the connectU MVP. All people and homes are fictional examples.

export const PREFERENCES = [
  { id: 'short', label: 'Short-term', sub: '1–6 months', icon: '◷' },
  { id: 'long', label: 'Long-term', sub: '6+ months', icon: '▦' },
  { id: 'student', label: 'Student housing', sub: 'Near campus', icon: '⌂' },
  { id: 'coliving', label: 'Co-living', sub: 'Shared house', icon: '⚇' },
  { id: 'furnished', label: 'Furnished', sub: 'Move-in ready', icon: '▭' },
  { id: 'pets', label: 'Pet-friendly', sub: 'Pets welcome', icon: '❦' },
  { id: 'center', label: 'City centre', sub: 'Kvadraturen', icon: '▲' },
  { id: 'budget', label: 'Budget-friendly', sub: 'Under NOK 5,500', icon: '◎' },
];

export const HOBBIES = [
  'Reading', 'Gym', 'Cooking', 'Hiking', 'Film', 'Gaming', 'Music', 'Football',
  'Climbing', 'Swimming', 'Photography', 'Board games', 'Running', 'Art', 'Travel', 'Coffee',
];

export const LIFESTYLE = {
  clean: { label: 'Cleanliness', options: ['Relaxed', 'Tidy', 'Very tidy'] },
  social: { label: 'At home I am', options: ['Quiet', 'Balanced', 'Social'] },
  sleep: { label: 'Daily rhythm', options: ['Early bird', 'Flexible', 'Night owl'] },
};

const P = (o) => o;

export const PEOPLE = [
  P({ id: 'ingrid', name: 'Ingrid', age: 20, study: 'Nursing', from: 'Bergen', budget: 5500, moveIn: '2027-08-01', pets: false,
      hobbies: ['Hiking', 'Cooking', 'Coffee', 'Music'], clean: 2, social: 1, sleep: 0, prefs: ['long', 'coliving', 'furnished'],
      bio: 'First year at UiA. I love weekend hikes and cooking big dinners for friends.', likesYou: true, color: '#C8603A' }),
  P({ id: 'jonas', name: 'Jonas', age: 21, study: 'Computer Science', from: 'Trondheim', budget: 6000, moveIn: '2027-08-01', pets: false,
      hobbies: ['Gaming', 'Climbing', 'Film', 'Coffee'], clean: 1, social: 1, sleep: 2, prefs: ['long', 'center', 'furnished'],
      bio: 'Quiet during exam weeks, up for board games the rest of the time.', likesYou: true, color: '#4A1D0E' }),
  P({ id: 'sofia', name: 'Sofia', age: 22, study: 'Exchange, Business', from: 'Madrid', budget: 5000, moveIn: '2027-01-10', pets: false,
      hobbies: ['Travel', 'Photography', 'Running', 'Cooking'], clean: 2, social: 2, sleep: 1, prefs: ['short', 'furnished', 'center'],
      bio: 'Here for one semester. Looking for flatmates who want to explore Sørlandet.', likesYou: true, color: '#A64425' }),
  P({ id: 'emil', name: 'Emil', age: 19, study: 'Sports Science', from: 'Stavanger', budget: 4800, moveIn: '2027-08-01', pets: false,
      hobbies: ['Football', 'Gym', 'Swimming', 'Gaming'], clean: 0, social: 2, sleep: 1, prefs: ['budget', 'student', 'long'],
      bio: 'Training most mornings. Easy-going, always up for pizza night.', likesYou: false, color: '#D98B6A' }),
  P({ id: 'maja', name: 'Maja', age: 23, study: 'Psychology', from: 'Tromsø', budget: 5800, moveIn: '2027-08-01', pets: true,
      hobbies: ['Reading', 'Art', 'Coffee', 'Hiking'], clean: 2, social: 1, sleep: 0, prefs: ['long', 'pets', 'coliving'],
      bio: 'Moving with my cat, Luna. Calm, tidy and happy to share a plant collection.', likesYou: true, color: '#7A3A22' }),
  P({ id: 'ali', name: 'Ali', age: 24, study: 'Civil Engineering', from: 'Oslo', budget: 6500, moveIn: '2027-08-15', pets: false,
      hobbies: ['Climbing', 'Photography', 'Cooking', 'Film'], clean: 2, social: 1, sleep: 1, prefs: ['long', 'center'],
      bio: 'Master student. I cook a lot and do the dishes straight after.', likesYou: false, color: '#B9542F' }),
  P({ id: 'hanna', name: 'Hanna', age: 20, study: 'Music Performance', from: 'Ålesund', budget: 5200, moveIn: '2027-08-01', pets: false,
      hobbies: ['Music', 'Film', 'Board games', 'Coffee'], clean: 1, social: 2, sleep: 2, prefs: ['coliving', 'budget', 'student'],
      bio: 'I practise piano on campus, not at home, promise.', likesYou: true, color: '#E07A50' }),
  P({ id: 'lukas', name: 'Lukas', age: 22, study: 'Exchange, Engineering', from: 'Munich', budget: 5600, moveIn: '2027-01-10', pets: false,
      hobbies: ['Hiking', 'Running', 'Travel', 'Swimming'], clean: 2, social: 1, sleep: 0, prefs: ['short', 'furnished'],
      bio: 'Spring semester exchange. Looking for an organised flat close to Gimlemoen.', likesYou: false, color: '#5C2A17' }),
  P({ id: 'thea', name: 'Thea', age: 21, study: 'Teacher Education', from: 'Drammen', budget: 5000, moveIn: '2027-08-01', pets: true,
      hobbies: ['Reading', 'Cooking', 'Board games', 'Art'], clean: 1, social: 1, sleep: 1, prefs: ['pets', 'budget', 'long'],
      bio: 'Second year, moving out of SiA housing. Love a cosy Sunday with tea.', likesYou: true, color: '#C8603A' }),
  P({ id: 'oskar', name: 'Oskar', age: 25, study: 'Business Administration', from: 'Kristiansand', budget: 7000, moveIn: '2027-06-01', pets: false,
      hobbies: ['Gym', 'Football', 'Travel', 'Coffee'], clean: 1, social: 2, sleep: 1, prefs: ['center', 'long'],
      bio: 'Local guy, happy to show newcomers the best spots in town.', likesYou: false, color: '#8F3E22' }),
];

export const LISTINGS = [
  { id: 'l1', area: 'Lund', title: '3-room flat near Lund torv', rooms: 2, rent: 5600, furnished: true, pets: false,
    minutes: 8, featured: true, landlord: 'Private landlord', move: '2027-08-01' },
  { id: 'l2', area: 'Kvadraturen', title: '4-room flat in the city centre', rooms: 3, rent: 6200, furnished: true, pets: false,
    minutes: 15, featured: true, landlord: 'Letting agent', move: '2027-08-01' },
  { id: 'l3', area: 'Gimlemoen', title: 'Shared house next to campus', rooms: 4, rent: 5100, furnished: false, pets: true,
    minutes: 3, featured: false, landlord: 'Private landlord', move: '2027-08-15' },
  { id: 'l4', area: 'Grim', title: '3-room flat with balcony', rooms: 2, rent: 5300, furnished: false, pets: true,
    minutes: 18, featured: false, landlord: 'Private landlord', move: '2027-07-01' },
  { id: 'l5', area: 'Vågsbygd', title: '5-room house with garden', rooms: 3, rent: 4700, furnished: true, pets: true,
    minutes: 22, featured: false, landlord: 'Private landlord', move: '2027-08-01' },
];

export const REPLIES = {
  ingrid: ['Hi! Nice to match 😊 Are you also starting in August?', 'I usually cook on Sundays, you are welcome to join!', 'Should we look at the Lund flat together?'],
  jonas: ['Hey! Good to match. Do you prefer Lund or the city centre?', 'I can be quiet during exams, no worries.', 'Want to add me to a group?'],
  sofia: ['Hola! I arrive in January, what about you?', 'I would love a flat near the centre.', 'Let’s explore Kristiansand together!'],
  maja: ['Hi! Just so you know, Luna the cat comes too 🐱', 'I like a tidy kitchen, how about you?', 'Gimlemoen house looks perfect for us.'],
  hanna: ['Hey hey! Board games this weekend?', 'I am pretty social but respect quiet hours.', 'Shall we make a group?'],
  thea: ['Hi! Lovely to match. Are you okay with pets?', 'I am moving out of SiA in summer.', 'The Grim flat allows pets 🙌'],
};

export const DEMO_ME = {
  name: 'Mari', age: 19, study: 'Business Administration', from: 'Hamar', budget: 5500, moveIn: '2027-08-01', pets: false,
  hobbies: ['Hiking', 'Cooking', 'Coffee', 'Reading'], clean: 2, social: 1, sleep: 1,
  prefs: ['long', 'coliving', 'furnished'], bio: 'Starting at UiA in August. Looking for calm, tidy flatmates who like a shared dinner now and then.',
  email: 'mari@student.uia.no', verified: true,
};
