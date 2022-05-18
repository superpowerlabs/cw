const express = require("express");
const cookieParser = require("cookie-parser");
const bodyParser = require("body-parser");
const cors = require("cors");

process.on("uncaughtException", function (error) {
  if(!error.isOperational)
    process.exit(1)
});

const app = express();

app.use(cors());
app.use(cookieParser());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ limit: "10mb", extended: false }));

app.use(express.static(__dirname + "/build"));

// error handler
app.use(function (err, req, res, next) {
  if (err.status !== 404) {
    console.debug(err);
    console.debug(err.status);
    console.debug(err.message);
  }

  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get("env") === "development" ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.json({ error: "Error" });
});

module.exports = app;
