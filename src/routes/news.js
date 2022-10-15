import { createChildRouter } from '#helpers/router.js';

import { newsController } from '#controllers/news.js';

const newsRouter = createChildRouter();

newsRouter.get('/getNews', newsController.getNews);
newsRouter.post('/postNews', newsController.postNewsBody);

export { newsRouter };
