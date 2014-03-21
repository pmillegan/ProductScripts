require 'fileutils'
include FileUtils

# Hello!!!! WELCOME TO CODE!
# This script will make folders and files, 
# go inside those folders and make more folders and files and so forth

ip= 'PeterPan'
character1= 'PeterPan'
character2= 'Twins'
MapName= 'Neverland'
cards1= 'London'
cards2= 'NeverLand'
cards3= 'NeverLandBlue'
cards4= 'NeverLandGreen'
cards5= 'Obstacles'
reg1= 'CrocodileCreek'
reg2= 'HomeUndeground'
reg3= 'JollyRoger'
reg4= 'London'
reg5= 'MermaidLagoon'
reg6= 'Neverwoods'
reg7= 'SkullRock'

cardnames = ['card_back.png','card_blue_2.png','card_blue_3.png','card_blue_4.png','card_blue_5.png','card_blue_6.png','card_blue_7.png','card_blue_8.png','card_blue_9.png','card_blue_10.png','card_blue_j.png','card_blue_q.png','card_blue_k.png','card_blue_a.png']

folders = [
{'name' => 'Animation', :patrick => [''], :tree => ['Characters', 'Map', 'PowerUps']},
{'name' => 'CharacterArt', :patrick => [''], :tree => [character1, character2]},
{'name' => 'Map' + ip, :patrick => [''], :files => [ip+'Map_background.png',ip+'_map_path_black.png',ip+'_map_path_white.png',ip+'-00.png',ip +'-01.png',ip+'-02.png',ip+'-03.png',ip+'-04.png',ip+'-05.png']},
{'name' => 'MapTutorial', :patrick => [''], :files => [ip+'_map_path_white.png',ip+'_intro_chapter_background.png']},
{'name' => 'Market', :patrick => [''], :tree =>['Placeholder Graphics'], :files => ['market_addtime.png','market_carddestroyer.png','market_extrafivecards.png','market_obstacledestroyer.png','market_shuffler.png','market_swapper.png','market_wildcard.png'] },
{'name' => 'PlayCards', :ryan => ['']},
{'name' => 'PlayScreenArt', :brandon=> ['']},
{'name' => 'UI', :steph => [''], :treet =>['Buttons', 'LevelComplete', 'LevelStaging', 'MapScreen', 'PlayScreen', 'PopUps'], :doubletree => [''], :files => ['']}

]

holders = [
{'name.b' => cards1, :cards => cardnames},
{'name.b' => cards2, :cards => cardnames},
{'name.b' => cards3, :cards => cardnames},
{'name.b' => cards4, :cards => cardnames},
{'name.b' => cards5, :cards => cardnames}

]

colders = [
{'name.c' => reg1, :regions => ['Background.png','DrawDeck.png']},
{'name.c' => reg2, :regions => ['Background.png','DrawDeck.png']},
{'name.c' => reg3, :regions => ['Background.png','DrawDeck.png']},
{'name.c' => reg4, :regions => ['Background.png','DrawDeck.png']},
{'name.c' => reg5, :regions => ['Background.png','DrawDeck.png']},
{'name.c' => reg6, :regions => ['Background.png','DrawDeck.png']},
{'name.c' => reg7, :regions => ['Background.png','DrawDeck.png']},

]

# cardnames = ['card_back.png','card_blue_2.png','card_blue_3.png','card_blue_4.png','card_blue_5.png','card_blue_6.png','card_blue_7.png','card_blue_8.png','card_blue_9.png','card_blue_10.png','card_blue_j.png','card_blue_q.png','card_blue_k.png','card_blue_a.png']

mkdir ip
cd (ip)
folders.each do |folder|

if folder [:patrick]
mkdir folder['name']
cd folder['name']

	if folder[:tree]
	mkdir folder[:tree]
	end
	
	if folder[:files]
	touch folder[:files]
	end
cd ('..')

elsif folder[:ryan]

mkdir folder['name']
cd folder ['name']

		holders.each do |holder|
	if holder [:cards]
	mkdir holder['name.b']
	cd holder['name.b']

	if holder[:cards]
	touch holder[:cards]
	end
	cd ('..')
	end
		end
		cd ('..')
		
elsif folder[:brandon]
mkdir folder['name']
cd folder ['name']

colders.each do |colder|
	if colder [:regions]
	mkdir colder['name.c']
	cd colder['name.c']

	if colder[:regions]
	touch colder[:regions]
	end
	cd ('..')
	end
		end
		cd ('..')


elsif folder[:steph]
mkdir folder['name']
cd (folder['name'])
mkdir folder[:treet]
cd ('MapScreen')
mkdir MapName
mkdir 'Tutorial'
cd ('..')
else
end
end
