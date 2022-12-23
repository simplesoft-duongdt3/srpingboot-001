import http from 'k6/http';
import { sleep } from 'k6';

export const options = {
  vus: 1000,
  duration: '10s',
};

export default function () {
  let randomNumber = Math.random() * 100;

  let myIp = "192.168.1.2";
  http.get('http://' + myIp + ':8989/create-url?rawUrl=https://meet.google.com/sbv-jbwj-ugg' + randomNumber);
  sleep(1);
}

// k6 run script.js --out json=test.json
// docker run --rm -i grafana/k6 run - <script.js


