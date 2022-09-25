import { studyService } from '#services/study.js';

export class StudyController {
    async getStudy(req, res) {
        res.setHeader('Access-Control-Allow-Origin', '*');
        try {
            res.status(200).send(studyService.getStudy());
        } catch (error) {
            res.status(500).json(error.code);
        }
    }
}

export const studyController = new StudyController();
