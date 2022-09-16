import { createChildRouter } from '../helpers/router.js';
import { testsController as controller } from '../controllers/tests.js';

// (YOUR) Custom, child router.
const router = createChildRouter();

router.get('/', controller.getTestDataById);

export { router as testsRouter };
