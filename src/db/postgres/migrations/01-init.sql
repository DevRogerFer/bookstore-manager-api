CREATE TABLE IF NOT EXISTS users (
    id UUID PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL,
    mail VARCHAR(100) NOT NULL UNIQUE,
);

CREATE TABLE IF NOT EXISTS categories (
    id UUID PRIMARY KEY,
    category VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS books (
    id UUID PRIMARY KEY,
    cover VARCHAR(255) NOT NULL,
    isbn VARCHAR(13) NOT NULL,
    title VARCHAR(100) NOT NULL,
    category UUID REFERENCES categories(id) ON DELETE CASCADE,
    author VARCHAR(100) NOT NULL,
    synopsis VARCHAR(500) NOT NULL
);

CREATE TYPE reading_status AS ENUM (
    'PENDING',
    'PROGRESS',
    'COMPLETED'
);

CREATE TABLE IF NOT EXISTS user_reading (
    user_id UUID REFERENCES users(id) ON DELETE CASCADE NOT NULL,
    book_id UUID REFERENCES books(id) ON DELETE CASCADE NOT NULL,
    status reading_status NOT NULL,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id, book_id)
);
