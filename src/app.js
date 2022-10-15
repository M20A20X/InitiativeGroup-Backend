// Main app file //
import Express from 'express';
import bodyParser from 'body-parser';
import { appRouter } from './routes/router.js';

const PORT = 5000;

const app = Express();

app.use(bodyParser.urlencoded({ extended: false }));
// parse application/json
app.use(bodyParser.json());
//
app.use('/', appRouter);

app.listen(PORT, () => {
    console.log(`Server running on port: ${PORT}`);
});
