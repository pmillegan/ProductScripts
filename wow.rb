	require 'capybara'
require 'capybara/dsl'

Capybara.current_driver = :selenium
Capybara.app_host = 'http://jira.playdom.com'

include Capybara::DSL

def fill_in_field (gadget, input_id, value)
	page.execute_script "document.getElementById('#{gadget}').contentWindow.document.getElementById('#{input_id}').setAttribute('value', '#{value}')"
end

def click_button_in_gadget (gadget, input_id)
	page.execute_script "document.getElementById('#{gadget}').contentWindow.document.getElementById('#{input_id}').click()"
end

visit('/')

fill_in_field('gadget-0', 'login-form-username', 'pmillegan')
fill_in_field('gadget-0', 'login-form-password', 'X')

click_button_in_gadget 'gadget-0', 'login'

sleep 2

previous = '20'
current = '21'
nextcurrent = '22'
future = '24'
chaptername = 'Mountain Mystic'
#Art Variables
wordgameskin = 'lbiancalana'
viralicon = 'lbiancalana'
animatedpath = 'ikuo'
concept = 'lbiancalana'
production = 'lbiancalana'
staffingicon = 'lbiancalana'
mapborder = 'lbiancalana'
newspaper = 'vserrano'
chapterimage = 'lbiancalana'
#Fix Version
fxvers = 'DWoW_RC_470'
fxversconcept = 'DWoW_RC_465'
#Components

tasks = [
	{ 'name' => 'PARENT: Chapter ' + current + ' - ' + chaptername, :first => 'lchen', :fixversion => 'Parent', :component => 'Product', :priority => 'Pri 2'},
	{ 'name' => 'ART - Create Wordgame Skin and BG for Chapter ' + current, :second => wordgameskin, :description => 'Spec: https://confluence.playdom.com/display/hattrick/Map+Chapters', :fixversion => fxvers, :component => 'Art', :priority => 'Pri 2'},
	{ 'name' => 'ENG - Delete "To Be Continued" from Ch ' + previous, :person => 'jyankowski', :fixversion => fxvers, :component => 'Engineering', :priority => 'Pri 2'},
	{ 'name' => 'ART - Viral icon for Chapter ' + current + ' (small and big)', :person => viralicon, :description => 'Spec: https://confluence.playdom.com/display/hattrick/Map+Chapters', :fixversion => fxvers, :component => 'Art', :priority => 'Pri 2'},
	{ 'name' => 'ART - Animated Path & Map for Chapter ' + current + '', :person => animatedpath, :description => 'Spec: https://confluence.playdom.com/display/hattrick/Map+Chapters', :fixversion => fxvers, :component => 'Art', :priority => 'Pri 2'},
	{ 'name' => 'DES - Choose Chapter ' + nextcurrent + ' obstacle', :person => 'nharling', :description => 'Spec: https://confluence.playdom.com/display/hattrick/Map+Chapters', :fixversion => fxversconcept, :component => 'Design', :priority => 'Pri 1'},
	{ 'name' => 'DES - Design and implement levels for Chapter ' + current + '', :person => 'nharling', :fixversion => fxvers, :component => 'Design', :priority => 'Pri 2'},
	{ 'name' => 'ART - Chapter ' + current + ' Production', :person => production, :fixversion => fxvers, :component => 'Art', :priority => 'Pri 2'},
	{ 'name' => 'ART - Create Staffing Icon for Chapter ' + current + '', :person => staffingicon, :description => 'Also send a 100 x 100 (vector) image of the icon to Shawna', :fixversion => fxvers, :component => 'Art', :priority => 'Pri 2'},
	{ 'name' => 'ART - Create Map Border for Chapter ' + current + '', :person => mapborder, :fixversion => fxvers, :component => 'Art', :priority => 'Pri 2'},
	{ 'name' => 'ART - Newspaper for Ch ' + current + '', :person => newspaper, :fixversion => fxvers, :component => 'Art', :priority => 'Pri 2'},
	{ 'name' => 'DES - Story text for Chapter ' + current + '', :person => 'nharling', :fixversion => fxvers, :component => 'Design', :priority => 'Pri 1'},
	{ 'name' => 'DES - Map data setup for Chapter ' + current + '', :person => 'nharling', :fixversion => fxvers, :component => 'Design', :priority => 'Pri 1'},
	{ 'name' => 'SOUND - Ambient track for Chapter ' + current + '', :person => 'cbarlow', :fixversion => fxvers, :component => 'Product', :priority => 'Pri 2'},
	{ 'name' => 'PROD - Create Chapter Difficulty AB test', :product => 'ruhrich', :fixversion => fxvers, :component => 'Product', :priority => 'Pri 2'},
	{ 'name' => 'ART: Chapter ' + current + ' image for staffing pop-up & staffing icons', :person => chapterimage, :description => 'Crop chapter background image for staffing pop-up. Icons: color and sepia versions.', :fixversion => fxvers, :component => 'Art', :priority => 'Pri 2'},
	{ 'name' => 'ENG: Update icons in word game UI for Chapter ' + current + '', :person => 'jyankowski', :description => 'These are for the icons on the left of the UI', :fixversion => fxvers, :component => 'Engineering', :priority => 'Pri 1'},
	{ 'name' => 'ENG: Hook up Chapter ' + current + ' staffing image and staff nodes to staffing pop-up', :person => 'lhicks', :fixversion => fxvers, :component => 'Engineering', :priority => 'Pri 1'},
	{ 'name' => 'ENG: Implement Base Map for Chapter ' + current + '', :person => 'jyankowski', :fixversion => fxvers, :component => 'Engineering', :priority => 'Pri 1'},
	{ 'name' => 'ENG: Implement Map Animations for Chapter ' + current + '', :person => 'jyankowski', :fixversion => fxvers, :component => 'Engineering', :priority => 'Pri 1'},
	{ 'name' => 'PROD - Ensure locale is chapter locked', :product => 'ruhrich', :fixversion => fxvers, :component => 'Product', :priority => 'Pri 1'},
	{ 'name' => 'PROD - Create email for Chapter ' + current + '', :product => 'ruhrich', :fixversion => fxvers, :component => 'Product', :priority => 'Pri 1'},
	{ 'name' => 'DES: Add/remove localization words from the dictionaries', :person => 'lhellinger', :fixversion => fxvers, :component => 'Design', :priority => 'Pri 2'},
	{ 'name' => 'DES: Add/remove localization words from the dictionaries', :person => 'lhellinger', :fixversion => fxvers, :component => 'Design', :priority => 'Pri 2'},
	{ 'name' => 'DES: New obstacle/mechanic tutorial text for Chapter ' + current + '', :person => 'nharling', :fixversion => fxvers, :component => 'Design', :priority => 'Pri 1'},
	{ 'name' => 'DES: Basic chapter design concept for Chapter ' + future + '', :person => 'nharling', :fixversion => fxversconcept, :component => 'Design', :priority => 'Pri 1'},
	{ 'name' => 'DES: Basic chapter design concept for Chapter ' + future + '', :person => 'nharling', :fixversion => fxversconcept, :component => 'Design', :priority => 'Pri 1'},
	{ 'name' => 'DES: Final chapter design for Chapter ' + future + '', :person => 'nharling', :fixversion => fxvers, :component => 'Design', :priority => 'Pri 1'}
	
]


tasks.each do |task|
	
	#Creating Parent
	if task[:first]
		click_link 'Create Issue'
		sleep 3
		page.execute_script "document.querySelector('#issuetype-single-select span').click()"
		page.execute_script "document.querySelector(\"#issuetype-suggestions li a[title='New Feature']\").click()"
		sleep 3

		fill_in 'summary', :with => task['name']

		fill_in 'priority-field', :with => task[:priority]
		click_link task[:priority]

		fill_in 'components-textarea', :with => task[:component]
		click_link task[:component]
		
		fill_in 'fixVersions-textarea', :with => task[:fixversion]
		click_link task[:fixversion]

		fill_in 'assignee-field', :with => task[:first]
		
		sleep 2

	click_button 'Create'

	sleep 4


	page.execute_script "document.querySelector('a.issue-created-key').click()"
	sleep 2
	#Making Sub Tasks
	elsif task[:second]
		sleep 3
		click_link 'More Actions'

		click_link 'Create Sub-Task'
		
		fill_in 'summary', :with => task['name']

		fill_in 'priority-field', :with => task[:priority]
		click_link task[:priority]

		fill_in 'components-textarea', :with => task[:component]
		click_link task[:component]

		fill_in 'fixVersions-textarea', :with => task[:fixversion]
		click_link task[:fixversion]
		
		fill_in 'assignee-field', :with => task[:second]

		fill_in 'description', :with => task[:description]

		sleep 2

		click_button 'Create'
		sleep 2
		
	elsif task[:third]
		sleep 1
		visit('/browse/JUST-4575')
	
		sleep 3
		click_link 'More Actions'

		click_link 'create-subtask'
		
		fill_in 'summary', :with => task['name']

		fill_in 'priority-field', :with => task[:priority]
		click_link task[:priority]

		fill_in 'components-textarea', :with => task[:component]
		click_link task[:component]

		fill_in 'fixVersions-textarea', :with => task[:fixversion]
		click_link task[:fixversion]
		
		fill_in 'assignee-field', :with => task[:third]

		fill_in 'description', :with => task[:description]

		sleep 2

		click_button 'Create'
		sleep 2
		
	elsif task[:product]
		sleep 3
		click_link 'More Actions'

		click_link 'create-subtask'
		
		fill_in 'summary', :with => task['name']

		fill_in 'priority-field', :with => task[:priority]
		click_link task[:priority]

		fill_in 'components-textarea', :with => task[:component]
		click_link('Product  - Product Tasks; Tamir, Alif')

		fill_in 'fixVersions-textarea', :with => task[:fixversion]
		click_link task[:fixversion]
		
		fill_in 'assignee-field', :with => task[:product]

		fill_in 'description', :with => task[:description]

		sleep 2

		click_button 'Create'
		sleep 2
		
	else task[:person]
		sleep 3
		click_link 'More Actions'

		click_link 'create-subtask'
		
		fill_in 'summary', :with => task['name']

		fill_in 'priority-field', :with => task[:priority]
		click_link task[:priority]

		fill_in 'components-textarea', :with => task[:component]
		click_link task[:component]

		fill_in 'fixVersions-textarea', :with => task[:fixversion]
		click_link task[:fixversion]
		
		fill_in 'assignee-field', :with => task[:person]

		fill_in 'description', :with => task[:description]

		sleep 2

		click_button 'Create'
		sleep 2
	end
end

sleep 6