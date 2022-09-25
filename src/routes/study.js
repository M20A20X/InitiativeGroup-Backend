import { createChildRouter } from '#helpers/router.js';

import { studyController } from '#controllers/study.js';

const studyRouter = createChildRouter();

studyRouter.get('/', studyController.getStudy);

export { studyRouter };
