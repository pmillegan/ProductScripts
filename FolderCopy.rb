require 'fileutils'
include FileUtils

ip= 'Frozen'

folders = [
{'name' => 'Backgrounds_LionKing', :new => 'Backgrounds_' + ip},
{'name' => 'Cards_LionKing', :new => 'Cards_' + ip},
{'name' => 'DrawDeck_LionKing', :new => 'DrawDeck_' + ip},
{'name' => 'Interstitials_LionKing', :new => 'Interstitials_' + ip},
{'name' => 'LevelComplete_LionKing', :new => 'LevelComplete_' + ip},
{'name' => 'LevelStaging_LionKing', :new => 'LevelStaging_' + ip},
{'name' => 'MapLionKing', :new => 'Map' + ip},
{'name' => 'MapLionKingTutorial', :new => 'Map' + ip + 'Tutorial'},
{'name' => 'Market_LionKing', :new => 'Market_' + ip},
{'name' => 'PlayHUD_LionKing', :new => 'PlayHUD_' + ip},
{'name' => 'Popup_LionKing', :new => 'Popup_' + ip}
]

folders.each do |folder|
cp_r folder['name'], folder[:new]
end