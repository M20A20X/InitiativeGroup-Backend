// Main app file //
import Express from 'express';
import { appRouter } from './routes/router.js';

const PORT = 5000;

const app = Express();
app.use('/', appRouter);

app.listen(PORT, () => {
    console.log(`Server running on port: ${PORT}`);
});
