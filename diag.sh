echo '=== hosts file dans meminator (doit contenir honeycomb et s3) ==='
docker compose exec -T meminator grep -E 'honeycomb|s3' /etc/hosts
echo '=== resolution honeycomb dans meminator ==='
docker compose exec -T meminator getent hosts api.honeycomb.io
echo '=== resolution s3 dans meminator ==='
docker compose exec -T meminator getent hosts random-pictures.s3.amazonaws.com
echo '=== git ==='
git log --oneline -1
echo '=== fin ==='
