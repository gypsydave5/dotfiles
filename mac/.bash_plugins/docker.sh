function dockerdie() {
	docker images --filter "dangling=true"
	docker rmi  $(docker images -f "dangling=true" -q)/
	docker rm -f $(docker ps -a -q)
}

function docker-delete-all(){
	docker rm $(docker ps -a -q)
	docker rmi $(docker images -q)
}

function docker-recreate-vb(){
	docker-machine create --driver virtualbox --virtualbox-disk-size "30000" dev
}

function docker-kill-all(){
	docker kill  $(docker ps -a -q)
}

function docker-stats-all(){
	docker stats $(docker ps | awk '{if(NR>1) print $NF}')
}

