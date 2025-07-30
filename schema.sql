--ENUM Definitions:
CREATE TYPE seat_class_enum AS ENUM ('front', 'middle', 'back');
CREATE TYPE purchase_method_enum AS ENUM ('online', 'box_office', 'cash', 'credit_card');

-- Table: Actors
CREATE TABLE Actors (
    id UUID PRIMARY KEY,
    name VARCHAR NOT NULL,
    bio TEXT,
    contact TEXT --Email, Phone number, address??
);

-- Table: Play
CREATE TABLE Play (
    id UUID PRIMARY KEY,
    title VARCHAR NOT NULL,
    duration INTEGER CHECK (duration > 0),
    author VARCHAR,
    has_recess BOOLEAN DEFAULT FALSE,
    short_description VARCHAR,
    long_description TEXT,
    club_free_ticket BOOLEAN DEFAULT FALSE,
    leading_actor_id UUID,  -- Foreign key will reference Actor(id) later
    CONSTRAINT fk_leading_actor FOREIGN KEY (leading_actor_id) REFERENCES Actors(id)
);

-- Table: Play & Actor junction table
CREATE TABLE Play_Actor (
    play_id UUID,
    actor_id UUID,
    PRIMARY KEY (play_id, actor_id),
    CONSTRAINT fk_play FOREIGN KEY (play_id) REFERENCES Play(id) ON DELETE CASCADE,
    CONSTRAINT fk_actor FOREIGN KEY (actor_id) REFERENCES Actors(id) ON DELETE CASCADE
);

-- Table: Performances
CREATE TABLE Performances (
    id UUID PRIMARY KEY,
    date_time TIMESTAMP UNIQUE, -- Prevent overlapping performances by enforcing a UNIQUE constraint on date_time
    club_free_tickets BOOLEAN DEFAULT TRUE,
    price_factor NUMERIC CHECK (price_factor >= 0),
    play_id UUID NOT NULL,
    CONSTRAINT fk_play_performance FOREIGN KEY (play_id) REFERENCES Play(id) ON DELETE CASCADE
);

-- Table: Performance & Actors junction table
CREATE TABLE Performance_Actor (
    performance_id UUID,
    actor_id UUID,
    PRIMARY KEY (performance_id, actor_id),
    CONSTRAINT fk_performance FOREIGN KEY (performance_id) REFERENCES Performances(id) ON DELETE CASCADE,
    CONSTRAINT fk_actor FOREIGN KEY (actor_id) REFERENCES Actors(id) ON DELETE CASCADE
);

-- Table: Club Member
CREATE TABLE ClubMember (
    id UUID PRIMARY KEY,
    name VARCHAR NOT NULL,
    contact_info TEXT,
    membership_start DATE NOT NULL,
    annual_fee NUMERIC,
    free_tickets INTEGER CHECK (free_tickets >= 0)
);

-- Table: Seat
CREATE TABLE Seat (
    id UUID PRIMARY KEY,
    row VARCHAR NOT NULL,
    number INTEGER NOT NULL,
    seat_class seat_class_enum NOT NULL,
    CONSTRAINT unique_row_number UNIQUE (row, number)
);

-- Table: Booking
CREATE TABLE Booking (
    id UUID PRIMARY KEY,
    performance_id UUID NOT NULL,
    seat_id UUID NOT NULL,
    club_member_id UUID,
    is_free BOOLEAN,
    is_discounted BOOLEAN,
    final_price NUMERIC NOT NULL CHECK (final_price >= 0),
    booking_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    purchase_method purchase_method_enum NOT NULL,

    CONSTRAINT fk_booking_performance FOREIGN KEY (performance_id) REFERENCES Performances(id) ON DELETE CASCADE,
    CONSTRAINT fk_booking_seat FOREIGN KEY (seat_id) REFERENCES Seat(id) ON DELETE CASCADE,
    CONSTRAINT fk_booking_member FOREIGN KEY (club_member_id) REFERENCES ClubMember(id) ON DELETE SET NULL,

    CONSTRAINT unique_booking_performance_seat UNIQUE (performance_id, seat_id)
);

-- Table: Club Seat Allocation
CREATE TABLE ClubSeatAllocation (
    id UUID PRIMARY KEY,
    performance_id UUID NOT NULL,
    seat_class seat_class_enum NOT NULL,
    reserved_count INTEGER CHECK (reserved_count >= 0),
    expiration_date DATE NOT NULL,
    free_tickets INTEGER CHECK (free_tickets >= 0),

    CONSTRAINT fk_allocation_performance FOREIGN KEY (performance_id) REFERENCES Performances(id) ON DELETE CASCADE
);

-- INDEXES:

--Quickly join club_member to booking. Helpful to see how many free tickets a member has used
CREATE INDEX idx_booking_member ON Booking(club_member_id);

--Lookups for specific seats and helps ensure unique bookings
CREATE INDEX idx_booking_perf_seat ON Booking(performance_id, seat_id);

--Helpful for automatic release to public after 3 days
CREATE INDEX idx_club_allocation_perf_class ON ClubSeatAllocation(performance_id, seat_class);

--Supports 3-day expiration of club seats
CREATE INDEX idx_performance_date ON Performances(date_time);

--Quickly access actors for a specific performance
CREATE INDEX idx_perf_actor_performance ON Performance_Actor(performance_id);




