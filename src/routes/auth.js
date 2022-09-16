// (YOUR) Custom router config file //

// Child router creator, helper.
import { createChildRouter } from '../helpers/router.js';

// Controller.
import { authController } from '../controllers/auth.js';

// (YOUR) Custom, child router.
const authRouter = createChildRouter();

authRouter.get('/', authController.get);

export { authRouter };