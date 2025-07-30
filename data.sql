--Insert into Actors
INSERT INTO Actors (id, name, bio, contact) VALUES 
('ee1d8099-978a-4ab9-ab65-72a8d1a066b0', 'Emma Thompson', 'Bio for Emma Thompson', 'emma@example.com'),
('a1075d51-fd8e-41cd-9a96-ee7255ca9d98', 'John Malkovich', 'Bio for John Malkovich', 'john@example.com'),
('806d7a10-d5c5-4afa-9535-129c637921ba', 'Meryl Streep', 'Bio for Meryl Streep', 'meryl@example.com'),
('28e9859b-2c64-42df-a436-2abf6b85169a', 'Daniel Day-Lewis', 'Bio for Daniel Day-Lewis', 'daniel@example.com'),
('4d394150-5bd6-461c-b6af-2a24f1dcc9cc', 'Angela Bassett', 'Bio for Angela Bassett', 'angela@example.com'),
('2bddb5f7-e886-4098-8052-5780d27595bd', 'Idris Elba', 'Bio for Idris Elba', 'idris@example.com'),
('a4f7eb3e-339e-422e-850c-b49cf1f3ffbf', 'Viola Davis', 'Bio for Viola Davis', 'viola@example.com'),
('f1eedfe4-d13f-46b0-b241-e28ed51f29b6', 'Rami Malek', 'Bio for Rami Malek', 'rami@example.com'),
('6c8018f9-6e85-45a8-884a-bb6891e168eb', 'Florence Pugh', 'Bio for Florence Pugh', 'florence@example.com'),
('90ce2d47-fbf7-4d17-af11-9570b6fee4ff', 'Tom Hiddleston', 'Bio for Tom Hiddleston', 'tom@example.com');
-- 2. Insert Plays
INSERT INTO Play (id, title, duration, author, has_recess, short_description, long_description, club_free_ticket, leading_actor_id) VALUES 
('e50cdff5-04c5-4cd4-b95b-6e2bc842cd47', 'Hamlet', 160, 'William Shakespeare', TRUE, 'Tragic tale of revenge', 'A prince seeks revenge on his uncle.', TRUE, 'ee1d8099-978a-4ab9-ab65-72a8d1a066b0'),
('427dbb5b-8cad-41ff-bd41-5d7774ba34f9', 'Les Misérables', 180, 'Victor Hugo', TRUE, 'Redemption and revolution', 'The struggles of Jean Valjean.', TRUE, 'a1075d51-fd8e-41cd-9a96-ee7255ca9d98'),
('791a7734-2d60-42ee-b7dc-9bba8fd2f6e3', 'The Crucible', 120, 'Arthur Miller', FALSE, 'Salem witch trials', 'Mass hysteria in a Puritan town.', FALSE, '806d7a10-d5c5-4afa-9535-129c637921ba'),
('3337b379-e880-4d4c-8d5f-e77f448cfa0a', 'Wicked', 155, 'Winnie Holzman', TRUE, 'The witches of Oz', 'The untold story of the witches.', TRUE, '28e9859b-2c64-42df-a436-2abf6b85169a'),
('0c7381d5-8d58-4686-9766-cc21c41d3ab7', 'A Streetcar Named Desire', 125, 'Tennessee Williams', FALSE, 'Southern drama', 'A Southern belle breakdown.', FALSE, '4d394150-5bd6-461c-b6af-2a24f1dcc9cc');

-- 3. Insert Club Members
INSERT INTO ClubMember (id, name, contact_info, membership_start, annual_fee, free_tickets) VALUES 
('d88a76ac-8131-4736-b526-eadf6b037658', 'Alice Stone', 'alice@example.com', '2024-01-01', 120.0, 6),
('95f66c15-846b-4849-a657-fd070470e930', 'Ben Foster', 'ben@example.com', '2023-05-10', 120.0, 8),
('435318d1-3b89-4544-b1e7-c6195775a948', 'Clara Kim', 'clara@example.com', '2025-01-01', 120.0, 4),
('34eb9321-21ef-4f1d-9daf-61cba14f9135', 'David Wu', 'david@example.com', '2023-09-01', 120.0, 8),
('139e43a1-5939-4e2f-86ad-ab20ba60c7b2', 'Eva Long', 'eva@example.com', '2022-11-11', 120.0, 8),
('20e6f18e-81e1-46ec-871c-f30ef87c904c', 'Frank Chen', 'frank@example.com', '2025-02-15', 120.0, 4),
('8d9245f8-7aa4-4dd1-844b-9a147993109f', 'Grace Patel', 'grace@example.com', '2023-03-20', 120.0, 6),
('9185136d-1307-4e70-bbef-b0af14ecf5ff', 'Hassan Ali', 'hassan@example.com', '2022-07-01', 120.0, 8);


-- 4. Insert Performances
INSERT INTO Performances (id, date_time, club_free_tickets, price_factor, play_id) VALUES 
('6f341aa7-a038-4f3e-a5b9-ba82fcfac7e9', '2025-05-01 19:00', TRUE, 1.0, 'e50cdff5-04c5-4cd4-b95b-6e2bc842cd47'),
('20242318-c0a3-4183-a69d-1502153813ee', '2025-05-03 14:00', TRUE, 1.2, 'e50cdff5-04c5-4cd4-b95b-6e2bc842cd47'),
('bb4beb57-57af-46ed-a4da-40821b7f72bf', '2025-05-05 20:00', FALSE, 1.5, '427dbb5b-8cad-41ff-bd41-5d7774ba34f9'),
('d7645c8b-0c3c-49b9-a815-73d152f02469', '2025-05-06 19:00', TRUE, 1.3, '427dbb5b-8cad-41ff-bd41-5d7774ba34f9'),
('39078f7e-d6a9-43cb-9f74-4b52ee6a5bb0', '2025-05-08 18:30', TRUE, 0.9, '791a7734-2d60-42ee-b7dc-9bba8fd2f6e3'),
('9ccd82c1-76dd-444f-bf35-0a43ecb3bf81', '2025-05-09 20:00', FALSE, 1.0, '791a7734-2d60-42ee-b7dc-9bba8fd2f6e3'),
('a12b4221-c85e-4a23-b7d5-810ddc58f241', '2025-05-10 19:30', TRUE, 1.1, '3337b379-e880-4d4c-8d5f-e77f448cfa0a'),
('60f8a841-a4ff-4fa9-88b3-9763546f3a77', '2025-05-11 14:00', TRUE, 1.4, '3337b379-e880-4d4c-8d5f-e77f448cfa0a'),
('f83c8e11-6b43-4e37-883f-0e64eb28dbe6', '2025-05-12 19:00', FALSE, 1.0, '0c7381d5-8d58-4686-9766-cc21c41d3ab7'),
('714b309e-8b54-48e4-9c6b-dac8839d37d5', '2025-05-13 20:00', TRUE, 0.8, '0c7381d5-8d58-4686-9766-cc21c41d3ab7');


-- 5. Insert Seats
INSERT INTO Seat (id, row, number, seat_class) VALUES
('fb1220fb-4bca-4c37-873c-aeeeac956d3c', 'A', 1, 'front'),
('493a3a78-ecf1-4f71-9fa6-c3110ddf1e6f', 'A', 2, 'front'),
('f919e1eb-8da9-450e-ba5a-9b33646e8b6c', 'A', 3, 'front'),
('530e6bf1-ebd7-4c00-af4b-1004c13d1cbb', 'A', 4, 'front'),
('abbbfa78-d2fd-4257-bf07-a80ef573c9d8', 'A', 5, 'front'),
('8b8b5234-ca47-4b4c-9109-d9a1b3da578a', 'B', 1, 'middle'),
('3263df41-9b71-41be-a0fc-bc11efebe79a', 'B', 2, 'middle'),
('d05768a8-82a8-4950-ae7d-4c7dca13cfad', 'B', 3, 'middle'),
('e75dd3c3-0615-45f6-a18f-463970607257', 'B', 4, 'middle'),
('f7ce5937-cd65-4523-8e13-2c364381a4c3', 'B', 5, 'middle'),
('cd18d48a-15b6-407d-88cf-6b82c89028ae', 'C', 1, 'back'),
('2faedcdb-ee19-416a-8f28-2b7a2f820035', 'C', 2, 'back'),
('5682fd5c-cb65-47c9-a5c7-25d8e9165fc1', 'C', 3, 'back'),
('41a1a5c5-cb64-4f20-9706-193041ece8f7', 'C', 4, 'back'),
('defb52e4-77f5-49a4-bdca-2b564a0ed15e', 'C', 5, 'back');

-- 6. Insert Play_Actor
INSERT INTO Play_Actor (play_id, actor_id) VALUES
('e50cdff5-04c5-4cd4-b95b-6e2bc842cd47', 'ee1d8099-978a-4ab9-ab65-72a8d1a066b0'),
('e50cdff5-04c5-4cd4-b95b-6e2bc842cd47', 'a1075d51-fd8e-41cd-9a96-ee7255ca9d98'),
('427dbb5b-8cad-41ff-bd41-5d7774ba34f9', '806d7a10-d5c5-4afa-9535-129c637921ba'),
('427dbb5b-8cad-41ff-bd41-5d7774ba34f9', '28e9859b-2c64-42df-a436-2abf6b85169a'),
('791a7734-2d60-42ee-b7dc-9bba8fd2f6e3', '4d394150-5bd6-461c-b6af-2a24f1dcc9cc'),
('791a7734-2d60-42ee-b7dc-9bba8fd2f6e3', '2bddb5f7-e886-4098-8052-5780d27595bd'),
('3337b379-e880-4d4c-8d5f-e77f448cfa0a', 'a4f7eb3e-339e-422e-850c-b49cf1f3ffbf'),
('3337b379-e880-4d4c-8d5f-e77f448cfa0a', 'f1eedfe4-d13f-46b0-b241-e28ed51f29b6'),
('0c7381d5-8d58-4686-9766-cc21c41d3ab7', '6c8018f9-6e85-45a8-884a-bb6891e168eb'),
('0c7381d5-8d58-4686-9766-cc21c41d3ab7', '90ce2d47-fbf7-4d17-af11-9570b6fee4ff');

-- 7. Insert Performance_Actor
INSERT INTO Performance_Actor (performance_id, actor_id) VALUES
('6f341aa7-a038-4f3e-a5b9-ba82fcfac7e9', 'ee1d8099-978a-4ab9-ab65-72a8d1a066b0'),
('20242318-c0a3-4183-a69d-1502153813ee', 'a1075d51-fd8e-41cd-9a96-ee7255ca9d98'),
('bb4beb57-57af-46ed-a4da-40821b7f72bf', '806d7a10-d5c5-4afa-9535-129c637921ba'),
('d7645c8b-0c3c-49b9-a815-73d152f02469', '28e9859b-2c64-42df-a436-2abf6b85169a'),
('39078f7e-d6a9-43cb-9f74-4b52ee6a5bb0', '4d394150-5bd6-461c-b6af-2a24f1dcc9cc'),
('9ccd82c1-76dd-444f-bf35-0a43ecb3bf81', '2bddb5f7-e886-4098-8052-5780d27595bd'),
('a12b4221-c85e-4a23-b7d5-810ddc58f241', 'a4f7eb3e-339e-422e-850c-b49cf1f3ffbf'),
('60f8a841-a4ff-4fa9-88b3-9763546f3a77', 'f1eedfe4-d13f-46b0-b241-e28ed51f29b6'),
('f83c8e11-6b43-4e37-883f-0e64eb28dbe6', '6c8018f9-6e85-45a8-884a-bb6891e168eb'),
('714b309e-8b54-48e4-9c6b-dac8839d37d5', '90ce2d47-fbf7-4d17-af11-9570b6fee4ff');


-- 9. Insert Booking (sample)
INSERT INTO Booking (id, performance_id, seat_id, club_member_id, is_free, is_discounted, final_price, booking_time, purchase_method) VALUES
('e104c3b3-c768-4f8a-b460-0b437c9aa613', '6f341aa7-a038-4f3e-a5b9-ba82fcfac7e9', 'fb1220fb-4bca-4c37-873c-aeeeac956d3c', 'd88a76ac-8131-4736-b526-eadf6b037658', FALSE, TRUE, 25.0, CURRENT_TIMESTAMP, 'online'),
('8cef5ff2-0ab0-4f5d-8813-d965ff127a52', '6f341aa7-a038-4f3e-a5b9-ba82fcfac7e9', '493a3a78-ecf1-4f71-9fa6-c3110ddf1e6f', '95f66c15-846b-4849-a657-fd070470e930', FALSE, FALSE, 25.0, CURRENT_TIMESTAMP, 'cash'),
('0f6e1a2b-82f2-4fd9-894d-240eb998517a', '6f341aa7-a038-4f3e-a5b9-ba82fcfac7e9', 'f919e1eb-8da9-450e-ba5a-9b33646e8b6c', '435318d1-3b89-4544-b1e7-c6195775a948', FALSE, TRUE, 25.0, CURRENT_TIMESTAMP, 'online');

-- 10. Insert ClubSeatAllocation
INSERT INTO ClubSeatAllocation (id, performance_id, seat_class, reserved_count, expiration_date, free_tickets) VALUES
('23975f19-b6c2-42d0-8f2f-ad81543e8f3c', '6f341aa7-a038-4f3e-a5b9-ba82fcfac7e9', 'front', 3, '2025-04-30', 1),
('5bc1b78b-b239-42f8-8b61-294b2f90e132', '6f341aa7-a038-4f3e-a5b9-ba82fcfac7e9', 'middle', 2, '2025-04-30', 0),
('c605d6aa-1d6e-4963-98a0-374e261d97b6', '20242318-c0a3-4183-a69d-1502153813ee', 'front', 3, '2025-04-30', 1),
('bfcf4c4f-2ce8-4d98-a1e9-eb58ae62b1db', '20242318-c0a3-4183-a69d-1502153813ee', 'middle', 2, '2025-04-30', 0);

