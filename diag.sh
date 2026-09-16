echo '=== TEST S3 depuis meminator ==='
docker compose exec -T meminator sh -c 'wget -q -T 15 -O /tmp/t.jpg https://random-pictures.s3.amazonaws.com/cat.jpg && ls -l /tmp/t.jpg || echo S3FAIL'
echo '=== bff: nb app.phrase (requetes recues) ==='
docker compose logs backend-for-frontend > bfflog.txt 2>&1
grep -c 'app.phrase' bfflog.txt
echo '=== bff: 30 dernieres lignes ==='
tail -30 bfflog.txt
echo '=== meminator: 30 dernieres lignes (sans bruit) ==='
docker compose logs meminator > memlog3.txt 2>&1
grep -vE 'opentelemetry|okhttp|RealCall|Caused by|at java|at jdk|at reactor|at org' memlog3.txt | tail -30
echo '=== fin ==='
