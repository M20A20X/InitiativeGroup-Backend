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
}

export const projectsController = new ProjectsController();
