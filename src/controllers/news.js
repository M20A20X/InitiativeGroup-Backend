import { newsService } from '#services/news.js';

export class NewsController {
    async getNews(req, res) {
        res.setHeader('Access-Control-Allow-Origin', '*');
        try {
            res.status(200).send(newsService.getNews());
        } catch (error) {
            res.status(500).json(error.code);
        }
    }
}

export const newsController = new NewsController();
