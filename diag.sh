echo '=== meminator: erreurs recentes ==='
docker compose logs meminator > memlog3.txt 2>&1
grep -inE 'error|exception' memlog3.txt | tail -40
echo '=== backend-for-frontend: erreurs recentes ==='
docker compose logs backend-for-frontend > bfflog.txt 2>&1
grep -inE 'error|exception' bfflog.txt | tail -40
echo '=== fin ==='
