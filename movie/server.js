const express = require('express');
const fs = require('fs').promises;
const bodyParser = require('body-parser');
const app = express();
const port = 3000;
const cors = require('cors');

app.use(cors());
app.use(bodyParser.json());
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
    await log(`Received data: ${JSON.stringify(req.body)}`);

    try {
        let newMovie = req.body;

        // Process genres and actors
        newMovie.genres = processArrayField(newMovie.genres);
        newMovie.actors = processArrayField(newMovie.actors);

        // Ensure all fields are present, use entered values or defaults
        newMovie = {
            title: newMovie.title || 'Untitled Movie',
            year: newMovie.year || new Date().getFullYear().toString(),
            genres: newMovie.genres,
            ratings: newMovie.ratings || [],
            poster: newMovie.poster || '',
            contentRating: newMovie.contentRating || '',
            duration: newMovie.duration || '',
            releaseDate: newMovie.releaseDate || '',
            averageRating: newMovie.averageRating || 0,
            originalTitle: newMovie.originalTitle || '',
            storyline: newMovie.storyline || '',
            actors: newMovie.actors,
            imdbRating: newMovie.imdbRating || 0,
            posterurl: newMovie.posterurl || ''
        };

        await log(`Processed movie data: ${JSON.stringify(newMovie)}`);

        // Read the existing data
        const data = await fs.readFile('data.json', 'utf8');
        let movies = JSON.parse(data);

        // Add the new movie
        movies.push(newMovie);

        // Write the updated data back to the file
        await fs.writeFile('data.json', JSON.stringify(movies, null, 2));
        await log('New movie added to data.json');

        res.status(201).json(newMovie);
    } catch (err) {
        await log(`Error processing request: ${err.message}`);
        console.error('Error processing request:', err);
        res.status(500).json({ error: 'Error processing the request', details: err.message });
    }
});

function processArrayField(field) {
    if (typeof field === 'string') {
        return field.split(',').map(item => item.trim());
    } else if (Array.isArray(field)) {
        return field;
    }
    return [];
}

// Listen on all network interfaces
app.listen(port, '0.0.0.0', () => {
    console.log(`Server running at http://0.0.0.0:${port}`);
    console.log(`Open your browser and navigate to http://localhost:${port} to view the application locally`);
    console.log(`To access from another device on your network, use your computer's IP address`);
});

