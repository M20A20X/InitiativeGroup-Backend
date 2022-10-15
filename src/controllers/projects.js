import { projectsService } from '#services/projects.js';

export class ProjectsController {
    async getProjects(req, res) {
        res.setHeader('Access-Control-Allow-Origin', '*');
        try {
            res.status(200).send(projectsService.getProjects());
        } catch (error) {
            res.status(500).json(error.code);
        }
    }
    async postProjectBody(req, res) {
        res.setHeader('Access-Control-Allow-Origin', '*');
        try {
            const { text, imageUrl } = req.body;
            res.status(200).json(
                await projectsService.PostProjects(text, imageUrl)
            );
        } catch (error) {
            res.status(500).json(error.code);
        }
    }
}

export const projectsController = new ProjectsController();
