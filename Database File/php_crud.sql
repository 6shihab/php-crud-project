CREATE DATABASE IF NOT EXISTS login_crud;


    USE login_crud;

    CREATE TABLE `users` (
      `id` int(12) NOT NULL,
      `username` varchar(255) NOT NULL,
      `email` varchar(255) NOT NULL,
      `password` varchar(255) NOT NULL
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


    INSERT INTO `users` (`id`, `username`, `email`, `password`) VALUES
    (31, 'Robin', 'robin1995will@gmail.com', 'Robin95will'),
    (32, 'Chris ', 'chrisrock4@gmail.com', 'chris@rock'),
    (33, 'Charlie', 'madcharlie@gmail.com', 'charlie1234'),
    (34, 'Andy', 'andyfun69@yahoo.in', 'andy@66');

    ALTER TABLE `users`
      ADD PRIMARY KEY (`id`);

    ALTER TABLE `users`
      MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

