<?php

return [
    'server' => getenv('DB_HOST'),
    'database' => getenv('DB_NAME'),
    'user' => getenv('DB_USER'),
    'password' => getenv('DB_PASS'),
    'tablePrefix' => getenv('DB_PREFIX'),
];
