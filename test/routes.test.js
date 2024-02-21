const request = require('supertest');
const app = require('../app'); // Đảm bảo đường dẫn tới app.js là chính xác

describe('GET /', function () {
    it('responds with HTML and status code 200', function (done) {
        request(app)
            .get('/')
            .expect('Content-Type', /html/)
            .expect(200, done);
    });
});