import http from 'k6/http';
import { htmlReport } from "https://raw.githubusercontent.com/benc-uk/k6-reporter/main/dist/bundle.js";
import { textSummary } from "https://jslib.k6.io/k6-summary/0.0.3/index.js";
import { sleep } from 'k6';

export const options = {
  vus: 200,
  duration: '10s',
};

export default function () {
  let randomNumber = Math.random() * 100;
  let myIp = "34.142.202.179";
  http.get('http://' + myIp + ':9898/create-url?rawUrl=https://meet.google.com/sbv-jbwj-ugg' + randomNumber);
  sleep(1);
}

// k6 run script.js --out json=test.json
// docker run --rm -i grafana/k6 run - <script.js


export function handleSummary(data) {
  return {
    "result.html": htmlReport(data),
    stdout: textSummary(data, { indent: " ", enableColors: true }),
    "result.json": JSON.stringify(data, null, 4),
  };
}