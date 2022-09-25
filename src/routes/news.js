import { createChildRouter } from '#helpers/router.js';

import { newsController } from '#controllers/news.js';

const newsRouter = createChildRouter();

newsRouter.get('/', newsController.getNews);

export { newsRouter };
