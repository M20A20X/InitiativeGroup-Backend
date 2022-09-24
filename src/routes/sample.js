// (YOUR) Custom router config file //

// Child router creator, helper.
import { createChildRouter } from '../helpers/router.js';

// (YOUR) Sample controller.
import { sampleController } from '../controllers/sample.js';

// (YOUR) Custom, child router.
const sampleRouter = createChildRouter();

sampleRouter.get('/', sampleController.get);

export { sampleRouter };
