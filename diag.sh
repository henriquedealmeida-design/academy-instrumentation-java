echo '=== meminator: erreurs (sans telemetry) ==='
docker compose logs meminator > memlog3.txt 2>&1
grep -inE 'error|exception' memlog3.txt | grep -vi opentelemetry | tail -30
echo '=== meminator: 25 dernieres lignes brutes ==='
tail -25 memlog3.txt
echo '=== bff: erreurs (sans telemetry) ==='
docker compose logs backend-for-frontend > bfflog.txt 2>&1
grep -inE 'error|exception' bfflog.txt | grep -vi opentelemetry | tail -30
echo '=== bff: lignes phrase/image ==='
grep -inE 'phrase|imageUrl|createPicture' bfflog.txt | tail -20
echo '=== fin ==='
