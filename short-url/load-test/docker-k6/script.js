import http from 'k6/http';
import { htmlReport } from "https://raw.githubusercontent.com/benc-uk/k6-reporter/main/dist/bundle.js";
import { textSummary } from "https://jslib.k6.io/k6-summary/0.0.3/index.js";
import { sleep } from 'k6';

// export const options = {
//   vus: 200,
//   duration: '10s',
// };

const isNumeric = (value) => /^\d+$/.test(value);

const default_vus = 200;

const target_vus_env = `${__ENV.TARGET_VUS}`;
const target_vus = isNumeric(target_vus_env) ? Number(target_vus_env) : default_vus;

export let options = {
  stages: [
      // Ramp-up from 1 to TARGET_VUS virtual users (VUs) in 5s
      { duration: "5s", target: target_vus },

      // Stay at rest on TARGET_VUS VUs for 10s
      { duration: "10s", target: target_vus },

      // Ramp-down from TARGET_VUS to 0 VUs for 5s
      { duration: "5s", target: 0 }
  ]
};

export default function () {
  let randomNumber = Math.random() * 100;
  let myIp = "34.142.202.179";
  http.get('http://' + myIp + ':9898/create-url?rawUrl=https://meet.google.com/sbv-jbwj-ugg' + randomNumber);
  sleep(0.300);
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