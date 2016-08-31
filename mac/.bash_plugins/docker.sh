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

function docker-kill-grep(){
    local DOCKER_IDS=$(docker ps --format "{{.ID}}\t{{.Names}}"| grep $1 | cut -f 1)
    local DOCKER_NAMES=$(docker ps --format "{{.Names}}"| grep $1)

    if [ -z "$DOCKER_IDS" ]; then
        echo "No processes found matching $1"
        return 1
    fi

    echo "Deleting containers:\n$DOCKER_NAMES"

    echo "$DOCKER_IDS" | xargs -n1 docker kill
    return 0
}

