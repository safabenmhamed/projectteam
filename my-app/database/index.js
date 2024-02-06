const mysql = require('mysql');

const connection = mysql.createConnection({
  host: 'localhost',
  user: '3amerni',
  password: '3amerni',
  database: '3amerni'
});

connection.connect((err) => {
  if (err) {
    console.log(err);
  } else {
    console.log('Connected to MySQL!')
  }
});
