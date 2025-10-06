-- ======= INIT (drop in FK order) =======
DROP TABLE IF EXISTS reviews;
DROP TABLE IF EXISTS user_books;
DROP TABLE IF EXISTS users;

-- ======= SCHEMA =======
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username TEXT UNIQUE NOT NULL,
  email TEXT UNIQUE NOT NULL,
  password TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE user_books (
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  book_id TEXT NOT NULL,
  status TEXT NOT NULL CHECK (status IN ('want_to_read','reading','completed')),
  progress INTEGER DEFAULT 0 CHECK (progress BETWEEN 0 AND 100),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  UNIQUE (user_id, book_id)
);

CREATE TABLE reviews (
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  book_id TEXT NOT NULL,
  rating INTEGER CHECK (rating BETWEEN 1 AND 5),
  comment TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
ALTER TABLE reviews
  ADD CONSTRAINT unique_user_book_review UNIQUE (user_id, book_id);

-- ======= USERS =======
-- bcrypt("$2b$12$...")는 예시용 동일 해시(테스트 로그인에 충분)
INSERT INTO users (username, email, password) VALUES
  ('testuser', 'test@user.com', '$2b$12$0zvFo89yqPOxZ4558IGvq.5/T2ScbUeM/2mzwXp6yQUDRx4jn4qG2'),
  ('reader2', 'reader2@example.com', '$2b$12$jofmqpDsSoQojOgzK5mfTOmiKH7ULXidKQ7ue2nwaKs7n9RENeMtu'),

  ('ashwin09',   'ashwin09@example.com',   '$2b$12$0zvFo89yqPOxZ4558IGvq.5/T2ScbUeM/2mzwXp6yQUDRx4jn4qG2'),
  ('yuki.mori',  'yuki.mori@example.com',  '$2b$12$0zvFo89yqPOxZ4558IGvq.5/T2ScbUeM/2mzwXp6yQUDRx4jn4qG2'),
  ('sven_l',     'sven.l@example.com',     '$2b$12$0zvFo89yqPOxZ4558IGvq.5/T2ScbUeM/2mzwXp6yQUDRx4jn4qG2'),
  ('luca.rossi', 'luca.rossi@example.com', '$2b$12$0zvFo89yqPOxZ4558IGvq.5/T2ScbUeM/2mzwXp6yQUDRx4jn4qG2'),
  ('ioannis',    'ioannis@example.com',    '$2b$12$0zvFo89yqPOxZ4558IGvq.5/T2ScbUeM/2mzwXp6yQUDRx4jn4qG2'),
  ('zofia_k',    'zofia.k@example.com',    '$2b$12$0zvFo89yqPOxZ4558IGvq.5/T2ScbUeM/2mzwXp6yQUDRx4jn4qG2'),
  ('mateo.r',    'mateo.r@example.com',    '$2b$12$0zvFo89yqPOxZ4558IGvq.5/T2ScbUeM/2mzwXp6yQUDRx4jn4qG2'),
  ('liam.b',     'liam.b@example.com',     '$2b$12$0zvFo89yqPOxZ4558IGvq.5/T2ScbUeM/2mzwXp6yQUDRx4jn4qG2'),
  ('emre',       'emre@example.com',       '$2b$12$0zvFo89yqPOxZ4558IGvq.5/T2ScbUeM/2mzwXp6yQUDRx4jn4qG2'),
  ('noah_k',     'noah.k@example.com',     '$2b$12$0zvFo89yqPOxZ4558IGvq.5/T2ScbUeM/2mzwXp6yQUDRx4jn4qG2'),
  ('eva.j',      'eva.j@example.com',      '$2b$12$0zvFo89yqPOxZ4558IGvq.5/T2ScbUeM/2mzwXp6yQUDRx4jn4qG2'),
  ('olga.v',     'olga.v@example.com',     '$2b$12$0zvFo89yqPOxZ4558IGvq.5/T2ScbUeM/2mzwXp6yQUDRx4jn4qG2'),
  ('haruto',     'haruto@example.com',     '$2b$12$0zvFo89yqPOxZ4558IGvq.5/T2ScbUeM/2mzwXp6yQUDRx4jn4qG2'),
  ('sofia.m',    'sofia.m@example.com',    '$2b$12$0zvFo89yqPOxZ4558IGvq.5/T2ScbUeM/2mzwXp6yQUDRx4jn4qG2'),
  ('arthur_c',   'arthur.c@example.com',   '$2b$12$0zvFo89yqPOxZ4558IGvq.5/T2ScbUeM/2mzwXp6yQUDRx4jn4qG2');

-- ======= USER_BOOKS  =======
INSERT INTO user_books (user_id, book_id, status, progress) VALUES
  -- testuser 
  (1, 'wrOQLV6xB-wC', 'reading', 40),
  (2, '6JbljwEACAAJ', 'want_to_read', 0),

  -- dummy data
  (3,  'mT4bBQAAQBAJ', 'completed',   100), -- All the Light We Cannot See
  (4,  'tLdiDwAAQBAJ', 'reading',      45), -- The Silent Patient
  (5,  'dvuK7isszLIC', 'want_to_read',  0), -- The Goldfinch
  (6,  'NdAmDwAAQBAJ', 'completed',    100), -- The Seven Husbands of Evelyn Hugo
  (7,  'opC3d3ltQ94C', 'reading',      30), -- The Song of Achilles
  (8,  'TuqPEAAAQBAJ', 'want_to_read',  0), -- Daisy Jones & The Six
  (9,  'WF9LDwAAQBAJ', 'completed',    100), -- Circe
  (10, 'kwBlDwAAQBAJ', 'reading',      70), -- Normal People
  (11, '0QE3BAAAQBAJ', 'completed',    100), -- The Nightingale
  (12, '2rrEAgAAQBAJ', 'reading',      55), -- The Martian
  (13, 'hxL2qWMAgv8C', 'want_to_read',  0), -- Gone Girl
  (14, 'Udv-AwAAQBAJ', 'reading',      25), -- The Girl on the Train
  (15, 'UzqVUdEtLDwC', 'completed',    100), -- The Fault in Our Stars
  (16, 'hlb_sM1AN0gC', 'completed',    100), -- The Hunger Games
  (17, '5-KerGE_DV0C', 'reading',      15), -- The Help
  (3,  'FzVjBgAAQBAJ', 'want_to_read',  0), -- The Alchemist
  (4,  'FmyBAwAAQBAJ', 'reading',      20), -- Sapiens
  (5,  '2ObWDgAAQBAJ', 'want_to_read',  0), -- Educated
  (6,  'Ui49ikr0728C', 'completed',    100); -- The Night Circus

-- ======= REVIEWS  =======
INSERT INTO reviews (user_id, book_id, rating, comment) VALUES
  (3,  'mT4bBQAAQBAJ', 5, 'Haunting and beautiful; totally deserved the Pulitzer.'),
  (4,  'tLdiDwAAQBAJ', 4, 'Great twisty thriller—kept me up late.'),
  (6,  'NdAmDwAAQBAJ', 5, 'Evelyn is iconic. Could not put it down.'),
  (9,  'WF9LDwAAQBAJ', 5, 'A gorgeous myth retelling—lyrical and powerful.'),
  (10, 'kwBlDwAAQBAJ', 4, 'Tender and messy in a very real way.'),
  (11, '0QE3BAAAQBAJ', 5, 'Devastating and hopeful; cried more than once.'),
  (12, '2rrEAgAAQBAJ', 5, 'Sciencey but funny—surprisingly heartwarming.'),
  (15, 'UzqVUdEtLDwC', 4, 'Emotional but not manipulative.'),
  (16, 'hlb_sM1AN0gC', 5, 'Still gripping after all these years.'),
  (6,  'Ui49ikr0728C', 4, 'Atmospheric—loved the black-and-white circus vibe.'),
  (3,  'FzVjBgAAQBAJ', 4, 'Simple parable with staying power.'),
  (4,  'FmyBAwAAQBAJ', 5, 'Mind-expanding big-picture history.'),
  (7,  'opC3d3ltQ94C', 5, 'Heartbreaking and beautiful love story.'),
  (13, 'hxL2qWMAgv8C', 4, 'Dark, smart, and addictive.'),
  (14, 'Udv-AwAAQBAJ', 3, 'Good commuter read; the pacing dips a bit.'),
  (5,  'dvuK7isszLIC', 4, 'Long but immersive—worth the time.'),
  (17, '5-KerGE_DV0C', 4, 'Warm, tense, and ultimately cathartic.');
