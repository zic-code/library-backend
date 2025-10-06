//helpers/token
//jwt token create
console.log("SECRET_KEY loaded:", process.env.SECRET_KEY);
const jwt = require("jsonwebtoken");
const SECRET_KEY = process.env.SECRET_KEY

function createToken(user) {
  return jwt.sign(
    { id: user.id, username: user.username, email: user.email },
    SECRET_KEY
  );
}

module.exports = { createToken }