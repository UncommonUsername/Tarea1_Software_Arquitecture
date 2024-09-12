import http from 'k6/http';
import { sleep } from 'k6';

export const options = {
  scenarios: {
    test_1: {
      executor: 'constant-arrival-rate',
      rate: 1,
      timeUnit: '5m',
      duration: '5m',
      preAllocatedVUs: 1,
    },
    test_10: {
      executor: 'constant-arrival-rate',
      rate: 10,
      timeUnit: '5m',
      duration: '5m',
      preAllocatedVUs: 2,
      startTime: '5m',
    },
    test_100: {
      executor: 'constant-arrival-rate',
      rate: 100,
      timeUnit: '5m',
      duration: '5m',
      preAllocatedVUs: 5,
      startTime: '10m',
    },
    test_1000: {
      executor: 'constant-arrival-rate',
      rate: 1000,
      timeUnit: '5m',
      duration: '5m',
      preAllocatedVUs: 20,
      startTime: '15m',
    },
    test_5000: {
      executor: 'constant-arrival-rate',
      rate: 5000,
      timeUnit: '5m',
      duration: '5m',
      preAllocatedVUs: 100,
      startTime: '20m',
    },
  },
};

export default function () {
  const response = http.get('http://localhost:4000');  // Replace with your Phoenix app URL
  console.log(`Response time: ${response.timings.duration} ms, Status: ${response.status}`);
}