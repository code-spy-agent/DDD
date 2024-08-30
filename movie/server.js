const express = require('express');
const fs = require('fs').promises;
const bodyParser = require('body-parser');
const app = express();
const port = 3000;
const cors = require('cors');

app.use(cors());
app.use(bodyParser.urlencoded({ extended: true }));

// Logger function
async function log(message) {
    const timestamp = new Date().toISOString();
    const logMessage = `${timestamp}: ${message}\n`;
    try {
        await fs.appendFile('server.log', logMessage);
    } catch (err) {
        console.error('Error writing to log file:', err);
    }
}

// Serve JSON data from the file
app.get('/data', async (req, res) => {
    await log('GET /data request received');
    try {
        const data = await fs.readFile('data.json', 'utf8');
        await log('data.json file read successfully');
        res.json(JSON.parse(data));
        await log('Data sent to client');
    } catch (err) {
        await log(`Error reading file: ${err.message}`);
        console.error('Error reading file:', err);
        res.status(500).json({ error: 'Error reading the JSON file' });
    }
});

// Add new POST route to receive and store movie data
app.post('/submit', async (req, res) => {
    await log('POST /submit request received');
    await log(`New movie object created: ${req.body}`);
    try {
        const newMovie = {
            title: req.body.title || 'Untitled Movie',
            year: req.body.year || new Date().getFullYear().toString(),
            genres: Array.isArray(req.body.genres) ? req.body.genres : req.body.genres.split(',').map(genre => genre.trim()),
            ratings: [],
            poster: req.body.poster || '',
            contentRating: req.body.contentRating || '',
            duration: req.body.duration || '',
            releaseDate: req.body.releaseDate || '',
            averageRating: 0,
            originalTitle: req.body.originalTitle || '',
            storyline: req.body.storyline || '',
            actors: Array.isArray(req.body.actors) ? req.body.actors : req.body.actors.split(',').map(actor => actor.trim()),
            imdbRating: 0,
            posterurl: req.body.posterurl || ''
        };
        await log(`New movie object created: ${JSON.stringify(newMovie)}`);

        const data = await fs.readFile('data.json', 'utf8');
        await log('Existing data read from data.json');
        let movies = JSON.parse(data);
        movies.push(newMovie);
        await log('New movie added to the movies array');

        await fs.writeFile('data.json', JSON.stringify(movies, null, 2));
        await log('Updated data written to data.json');
        res.status(201).json(newMovie);
        await log('Response sent to client');
    } catch (err) {
        await log(`Error processing request: ${err.message}`);
        console.error('Error processing request:', err);
        res.status(500).json({ error: 'Error processing the request', details: err.message });
    }
});

// Start the server
app.listen(port, () => {
    log(`Server started and listening on port ${port}`);
    console.log(`Server running at http://localhost:${port}`);
});

