import { createChildRouter } from '#helpers/router.js';
import { profileController } from '#controllers/profile.js';

const profileRouter = createChildRouter();

profileRouter.get('/', profileController.getUserData);
profileRouter.post('/vote', profileController.postVote);

export { profileRouter };
