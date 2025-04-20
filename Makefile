deploy:
	ssh deploy@${HOST} -p ${PORT} 'rm -rf npm && mkdir npm'
	scp -P ${PORT} compose.yml deploy@${HOST}:npm/compose.yml
	ssh deploy@${HOST} -p ${PORT} 'cd npm && docker compose down --remove-orphans'
	ssh deploy@${HOST} -p ${PORT} 'cd npm && docker compose pull'
	ssh deploy@${HOST} -p ${PORT} 'cd npm && docker compose up -d'