import http from 'k6/http';
import { sleep } from 'k6';

export const options = {
  vus: 4,  // 4 virtual users
  duration: '5m',  // Test runs for 5 minutes
  iterations: 1000,  // Total number of requests
};

export default function () {
  http.get('http://localhost:4000');  // Replace with your Phoenix app URL
  sleep(0.3);  // Add a small delay between requests
}