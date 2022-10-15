import { createChildRouter } from '#helpers/router.js';

import { studyController } from '#controllers/study.js';

const studyRouter = createChildRouter();

studyRouter.get('/getStudy', studyController.getStudy);
studyRouter.post('/postStudy', studyController.postStudyBody);

export { studyRouter };
