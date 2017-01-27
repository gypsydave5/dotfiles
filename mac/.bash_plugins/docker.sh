#!/bin/bash

function dockerdie() {
	docker images --filter "dangling=true"
	docker rmi  $(docker images -f "dangling=true" -q)/
	docker rm -f $(docker ps -a -q)
}

function docker-delete-all(){
	docker rm $(docker ps -a -q)
	docker rmi $(docker images -q)
}

function docker-kill-all(){
	docker kill  $(docker ps -a -q)
}

function docker-stats-all(){
	docker stats $(docker ps | awk '{if(NR>1) print $NF}')
}

function docker-remove-exited() {
    docker rm -v $(docker ps -a -f status=exited -q)
}

function docker-remove-dangling() {
    docker rmi $(docker images --no-trunk -f dangling=true)
}


