const express = require("express");
const titleRouter = express.Router();
const Title = require("../models/titleModel");

// Route to get all titles
titleRouter.get("/", async (req, res, next) => {
  try {
    const titles = await Title.find();
    res.json(titles);
  } catch (err) {
    next(err);
  }
});

// Route to create a new title
titleRouter.post("/", async (req, res, next) => {
  try {
    const { Video, Audio, No, Title, Song } = req.body; // Destructure the properties from req.body
    if (!Video || !Audio || !No || !Title || !Song) { // Check if required fields are missing
      return res.status(400).json({ message: "All fields are required" });
    }
    const newTitle = new Title({
      Video,
      Audio,
      No,
      Title,
      Song
    });
    const savedTitle = await newTitle.save();
    res.status(201).json(savedTitle); // Return 201 status for successful creation
  } catch (err) {
    next(err);
  }
});

module.exports = titleRouter;
