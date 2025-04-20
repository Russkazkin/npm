deploy:
	ssh deploy@${HOST} -p ${PORT} 'rm -rf npm && mkdir npm'
	ssh deploy@${HOST} -p ${PORT} 'mkdir npm/secrets'
	scp -P ${PORT} compose.yml deploy@${HOST}:npm/compose.yml
	scp -P ${PORT} ./docker/secrets/db_password deploy@${HOST}:npm/secrets
	ssh deploy@${HOST} -p ${PORT} 'cd npm && docker compose down --remove-orphans'
	ssh deploy@${HOST} -p ${PORT} 'cd npm && docker compose pull'
	ssh deploy@${HOST} -p ${PORT} 'cd npm && docker compose up -d'