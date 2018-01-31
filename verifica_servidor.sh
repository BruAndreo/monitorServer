#!/bin/bash

#Alterar site para o que deseja ser monitorado
codigo_http=$(curl --write-out %{http_code} --silent --output /dev/null www.amlconsulting.com.br)

if [$codigo_http -ne 200]; then
	#Alterar caminho de armazenamento do log
	arqLogs = "./ErrorsLogs/$(date +%F\_%H\-%M\-%S)_server_monitor.log"

	echo "[$(date +%F\ %T)] -> Error Code: $codigo_http --> Tentando reiniciar o serviço" >> $arqLogs

	systemctl restart httpd
fi
