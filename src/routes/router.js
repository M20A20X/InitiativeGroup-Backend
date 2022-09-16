// App router config file //
import { Router } from 'express';

// YOU NEED TO ADD ONLY 1 IMPORT BELOW THIS COMMENT,
// PLEASE GROUP YOUR ROUTERS IN ALPHABETICAL ORDER.
// Importing your custom router.
import { authRouter } from './auth.js';

export const appRouter = Router();

// YOU NEED TO ADD ONLY 1 LINE BELOW THIS COMMENT,
// PLEASE GROUP YOUR ROUTERS IN ALPHABETICAL ORDER.
// Connecting your custom router to app router.
appRouter.use('/auth', authRouter);
