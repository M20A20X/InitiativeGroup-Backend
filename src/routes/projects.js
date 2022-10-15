import { createChildRouter } from '#helpers/router.js';

import { projectsController } from '#controllers/projects.js';

const projectsRouter = createChildRouter();

projectsRouter.get('/getProjects', projectsController.getProjects);
projectsRouter.post('/postProjects', projectsController.postProjectBody);

export { projectsRouter };
