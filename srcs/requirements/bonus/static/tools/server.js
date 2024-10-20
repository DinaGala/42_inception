
import express from 'express'; // Change this to import syntax
import path from 'path';
import { fileURLToPath } from 'url';

// Define __dirname for ES modules
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);


const app = express();
const port = 3000;

// Serve static files from the "content" directory
app.use(express.static(path.join(__dirname, '../content')));

// Start the server
app.listen(port, () => {
    console.log(`Server is running at http://localhost:${port}`);
});