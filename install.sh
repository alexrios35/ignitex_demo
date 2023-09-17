#! bash

function spti () {
	echo -e "\e[95m◄⟩\e[0m \e[105m\e[30m $1 \e[0m \e[95m⟨►\e[0m\n";
};

function spto () {
	echo -e "\n\e[1m\e[95m\e[40m⟩⟩ $1 ;\e[0m\n";
};

function spsy () {
	echo -e "\e[95m ◢ ◣ - – — ⋱ ~ ╲\e[0m\n\e[95m ◥ ◤ - – — ⋰ ~ ╱\e[0m\n"
};

clear && spsy

spti "SYSTEM > Update" && apt update -y && spto "SYSTEM > Update"
spti "SYSTEM > Upgrade" && apt upgrade -y && spto "SYSTEM > Upgrade"

clear && spsy

while read line; do
	name=$(echo $line | awk -F "|" '{print $1}')
	label=$(echo $line | awk -F "|" '{print $NF}')

	spti "$label" && pkg install $name -y && spto "$label"
done < list.txt