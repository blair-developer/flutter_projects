const express = require('express');
const bodyParser = require('body-parser');
const mongoose = require('mongoose');
const titleRouter = require("./controllers/titleController");

const PORT = process.env.PORT || 3000;
const app = express();
app.use(bodyParser.json());

app.use(titleRouter);

// MongoDB connection URI with SSL/TLS options
const DB = "mongodb+srv://blairdeveloper17:OBUF72LY3PLw1gOa@cluster0.reyg6sl.mongodb.net/nzk?retryWrites=true&w=majority&appName=Cluster0&ssl=true&tls=true";

// Mongoose connection options
const options = {
  useNewUrlParser: true,
  useUnifiedTopology: true
};

mongoose.connect(DB, options)
  .then(() => {
    console.log("MongoDB Connected");
    app.listen(PORT, "0.0.0.0", () => {
      console.log(`Server is running on port ${PORT}`);
    });
  })
  .catch(err => {
    console.error("MongoDB connection error:", err);
  });
