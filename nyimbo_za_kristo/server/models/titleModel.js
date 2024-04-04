const mongoose = require('mongoose');

const songSchema = new mongoose.Schema({
  Video: {
    type: String,
    required: true,
  },
  Audio: {
    type: String,
    required: true,
  },
  No: {
    type: String,
    required: true,
  },
  Title: {
    type: String,
    required: true,
  },
  Song: {
    type: String,
    required: true,
  }
});

const Song = mongoose.model('Song', songSchema);

module.exports = Song;
