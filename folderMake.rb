require 'fileutils'
include FileUtils

# This Script will make folders with a variable concatenated out


ip= 'Frozen'

folders = [
{'name' => 'Background_' + ip},
{'name' => 'Cards_' + ip},
{'name' => 'DrawDeck_' + ip},
{'name' => 'Interstitials_' + ip},
{'name' => 'LevelComplete_' + ip},
{'name' => 'LevelStaging_' + ip},
{'name' => 'Map' + ip},
{'name' => 'Map' + ip + 'Tutorial'},
{'name' => 'Market_' + ip},
{'name' => 'PlayHUD_' + ip},
{'name' => 'Popup_' + ip}
]

folders.each do |folder|
mkdir folder['name']
end
