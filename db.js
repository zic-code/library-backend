//  postgresql connection configuration

const { Client } = require("pg");
require("dotenv").config();


console.log("Loaded DB URL:", process.env.DATABASE_URL);
const db = new Client({
  connectionString:  process.env.DATABASE_URL ,
});

db.connect();

module.exports = db;
