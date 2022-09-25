import { createChildRouter } from '#helpers/router.js';

import { projectsController } from '#controllers/projects.js';

const projectsRouter = createChildRouter();

projectsRouter.get('/', projectsController.getProjects);

export { projectsRouter };
