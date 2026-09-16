echo '=== VM nameserver ==='
grep nameserver /etc/resolv.conf
echo '=== container resolv.conf ==='
docker compose exec -T meminator cat /etc/resolv.conf
echo '=== DNS test dans meminator: honeycomb ==='
docker compose exec -T meminator getent hosts api.honeycomb.io
echo '=== DNS test dans meminator: s3 ==='
docker compose exec -T meminator getent hosts random-pictures.s3.amazonaws.com
echo '=== git ==='
git log --oneline -1
echo '=== fin ==='
