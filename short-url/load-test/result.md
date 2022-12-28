1. running (10.8s), 000/200 VUs, 1955 complete and 0 interrupted iterations
default ✓ [======================================] 200 VUs  10s

     data_received..................: 559 kB 52 kB/s
     data_sent......................: 305 kB 28 kB/s
     http_req_blocked...............: avg=30.87ms  min=1µs     med=4µs     max=1.08s    p(90)=52.28ms p(95)=89.83ms
     http_req_connecting............: avg=30.86ms  min=0s      med=0s      max=1.08s    p(90)=52.26ms p(95)=89.81ms
     http_req_duration..............: avg=60.38ms  min=47.25ms med=59.13ms max=103.09ms p(90)=69.32ms p(95)=82.27ms
       { expected_response:true }...: avg=60.38ms  min=47.25ms med=59.13ms max=103.09ms p(90)=69.32ms p(95)=82.27ms
     http_req_failed................: 0.00%  ✓ 0          ✗ 1955 
     http_req_receiving.............: avg=171.85µs min=9µs     med=30µs    max=19.35ms  p(90)=125.4µs p(95)=1.08ms 
     http_req_sending...............: avg=19.99µs  min=3µs     med=12µs    max=663µs    p(90)=28µs    p(95)=57µs   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s     
     http_req_waiting...............: avg=60.18ms  min=47.17ms med=58.88ms max=103.03ms p(90)=69.19ms p(95)=82.19ms
     http_reqs......................: 1955   181.480049/s
     iteration_duration.............: avg=1.09s    min=1.04s   med=1.05s   max=2.14s    p(90)=1.11s   p(95)=1.17s  
     iterations.....................: 1955   181.480049/s
     vus............................: 200    min=200      max=200
     vus_max........................: 200    min=200      max=200


2. running (31.1s), 0000/2000 VUs, 6781 complete and 0 interrupted iterations
default ✓ [======================================] 2000 VUs  10s

     data_received..................: 1.7 MB 55 kB/s
     data_sent......................: 928 kB 30 kB/s
     http_req_blocked...............: avg=1.15s    min=0s      med=3µs     max=19.23s  p(90)=4.06s    p(95)=7.16s   
     http_req_connecting............: avg=1.15s    min=0s      med=0s      max=19.23s  p(90)=4.06s    p(95)=7.16s   
     http_req_duration..............: avg=79.73ms  min=0s      med=67ms    max=1.95s   p(90)=153.54ms p(95)=173.04ms
       { expected_response:true }...: avg=90.96ms  min=47.24ms med=69.08ms max=1.95s   p(90)=157.26ms p(95)=185.72ms
     http_req_failed................: 12.34% ✓ 837        ✗ 5944  
     http_req_receiving.............: avg=136.19µs min=0s      med=28µs    max=17.22ms p(90)=81µs     p(95)=617µs   
     http_req_sending...............: avg=26.33µs  min=0s      med=11µs    max=877µs   p(90)=58µs     p(95)=101µs   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s      p(90)=0s       p(95)=0s      
     http_req_waiting...............: avg=79.57ms  min=0s      med=66.77ms max=1.95s   p(90)=153.19ms p(95)=172.86ms
     http_reqs......................: 6781   217.776651/s
     iteration_duration.............: avg=5.93s    min=1.04s   med=1.07s   max=31.12s  p(90)=31s      p(95)=31.04s  
     iterations.....................: 6781   217.776651/s
     vus............................: 837    min=837      max=2000
     vus_max........................: 2000   min=2000     max=2000