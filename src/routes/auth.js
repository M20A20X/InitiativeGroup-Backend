import { createChildRouter } from '#helpers/router.js';
import { authController } from '#controllers/authController.js';

const authRouter = createChildRouter();

authRouter.post('/login', authController.login);
authRouter.post('/registration', authController.registration);
authRouter.get('/users', authController.getUsers);

export { authRouter };
