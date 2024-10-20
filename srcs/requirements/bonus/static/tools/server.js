
import express from 'express'; // Change this to import syntax
import path from 'path';

const app = express();
const port = 3000;

// Serve static files from the "content" directory
app.use(express.static(path.join(__dirname, '../content')));

// Start the server
app.listen(port, () => {
    console.log(`Server is running at http://localhost:${port}`);
});