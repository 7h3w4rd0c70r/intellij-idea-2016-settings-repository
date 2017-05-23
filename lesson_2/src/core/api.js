
import axios from 'axios'

export default axios.create({
    baseURL: 'http://localhost/gallery',
    transformResponse: [(data) => {
        return JSON.parse(data);
    }]
})
