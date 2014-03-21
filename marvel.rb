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

# Replace XXXXX with your username and password before running.
fill_in_field('gadget-0', 'login-form-username', 'pmillegan')
fill_in_field('gadget-0', 'login-form-password', 'X')

click_button_in_gadget 'gadget-0', 'login'

sleep 2

hero = 'DEADPOOL'

#Fix Version
# Make sure Product Owner Creates Desired Fix Version before running. Case matters.
fxvers = '3.2 (BE tickets)'
#Components

tasks = [
	{ 'name' => '[MASTER TICKET] - [HERO] -- ' + hero + '', :first => 'asarkarati', :priority => 'Pri 6', :description => 'This is the master ticket for ' + hero},
	{ 'name' => '[PROD] Implement ' + hero + ' into CMS', :second => 'asarkarati', :fixversion => fxvers, :description => 'Implement all ' + hero + ' entries into CMS: 

Characters:
If ' + hero + ' is a hero: 
Characters => Heroes
CharactersHeroAbilities => Heroes

If ' + hero + ' is a villain: 
Characters => Villains
CharactersVillainAbilities => VillainAbilities

Ensure HeroKey is properly set for ' + hero + '.

-----------

CharactersGenericAbilities => GenericAbilities

AiScripts => AiScriptRules
Ensure Chapter Appearances are correct.
Ensure Distress Call is correct.
Ensure PvP AI is correct.

Statuses => Statuses

Dialogs => DialogImageAssets
Dialogs => HeroRecruitDialogs
Dialogs => The appropriate Chapter or SecretMissionsDialogs

NewsPage => SplashAssets
NewsPage => FeaturedItems

Uniforms => HeroUniforms'},
	{ 'name' => '[PROD] Provide Art Team Info about' + hero, :person => 'asarkarati', :description => 'Detail the following for art:
Characters
fx
Statuses', :fixversion => fxvers},
	{ 'name' => '[ART] Create SD source files and PVP source files for ' + hero, :person => 'dwells', :fixversion => fxvers, :description => 'Create SD source files and PVP source files for ' + hero +'.'},
	{ 'name' => '[ART] Outsource request for HD and PVP for ' + hero, :person => 'dwells', :description => 'Outsource request for HD and PVP Source Files for' + hero, :fixversion => fxvers},
	{ 'name' => '[ART] All Uniforms assets and PVP source files for ' + hero, :person => 'dwells', :description => 'Create all uniform assets and PVP source files for '+ hero +'.', :fixversion => fxvers},
	{ 'name' => '[ART] FX assets for ' + hero, :person => 'dwells', :description => 'Create FX assets for ' + hero, :fixversion => fxvers},
	{ 'name' => '[ART] Character Icons, Action Icons, and Dialog Images for ' + hero, :person => 'jyun',:description => 'Create Character Icons, Action Icons and Dialog Images for ' + hero, :fixversion => fxvers},
	{ 'name' => '[ART] Create Newspaper Image for ' + hero, :person => 'jyun', :fixversion => fxvers, :description => 'Create Newspaper Image for ' + hero +'.
Image:
' + hero + '
Text:
'+ hero + '\'s here!
[Go Now]'},
	{ 'name' => '[DEV] MP3 Sound Files for ' + hero, :person => 'asarkarati', :description => 'Ensure all MP3 files needed for ' + hero + ' exist.', :fixversion => fxvers},
	{ 'name' => '[DEV] Move assets to CDN', :person => 'asarkarati', :fixversion => fxvers, :description => 'Ensure all assets needed from Web Snapshot for ' + hero +' exist in CDN.'},
	{ 'name' => '[DEV] Test and do basic sanity for ' + hero, :person => 'asarkarati', :fixversion => fxvers, :description => 'Ensure on Dev environment that ' + hero + ' exists and behaves as expected.'},
	{ 'name' => '[QA] Test SD and HD Assets for ' + hero + ' uniforms.', :person => 'sislam', :fixversion => fxvers, :description => 'Test SD and HD assets for all of ' + hero + ' uniforms in the tool or in game.'},
	{ 'name' => '[QA] Check all of ' + hero + 'S moves in multiple missions.', :person => 'sislam', :fixversion => fxvers, :description => 'Check '+ hero +'S abilities in multiple missions.'},
	{ 'name' => '[QA] Check ' + hero + ' AI Statues and Actions', :person => 'sislam', :fixversion => fxvers, :description => 'Check to make sure that '+ hero +' behaves as expected when controlled by AI and all Statuses are correctly applied.'},
	{ 'name' => '[QA] Check flipped ' + hero + ' character for PVP version.', :person => 'sislam', :fixversion => fxvers, :description => 'If ' + hero + ' is a hero, check the PVP implementation to ensure that the characters is properly flipped, and displays correctly.'},
	{ 'name' => '[QA] Check all ' + hero + ' icons', :person => 'sislam', :description => 'Ensure all locations of ' + hero +'\'s icons appear where expected:
Team Page
Combat Huds', :fixversion => fxvers, :component => 'Art', :priority => 'Pri 2'},
	{ 'name' => '[PROD] Localization team approval for ' + hero +'.', :person => 'asarkarati', :description => 'Ensure all strings related to ' + hero + ' have been successfully localized:
Recruit dialogs.
Story dialogs.', :fixversion => fxvers}
	
]


tasks.each do |task|
	
	#Creating Parent
	if task[:first]
		click_link 'Create Issue'
		sleep 3
		page.execute_script "document.querySelector('#issuetype-single-select span').click()"
		page.execute_script "document.querySelector(\"#issuetype-suggestions li a[title='New Feature']\").click()"

		fill_in 'summary', :with => task['name']

		fill_in 'priority-field', :with => task[:priority]
		click_link task[:priority]


		fill_in 'assignee-field', :with => task[:first]
		click_link task[:first]

		
		fill_in 'description', :with => task[:description]
		

	click_button 'Create'

	sleep 4


	page.execute_script "document.querySelector('a.issue-created-key').click()"
	sleep 1
	#Making Sub Tasks
	elsif task[:second]
		click_link 'More Actions'

		click_link 'Create Sub-Task'
		
		fill_in 'summary', :with => task['name']

		fill_in 'fixVersions-textarea', :with => task[:fixversion]
		click_link task[:fixversion]
		
		fill_in 'assignee-field', :with => task[:second]
		click_link task[:second]

		fill_in 'description', :with => task[:description]

		click_button 'Create'
		
		puts task['name']
		
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
		puts task['name']
		
	else task[:person]
		click_link 'More Actions'

		click_link 'create-subtask'
		
		fill_in 'summary', :with => task['name']

		fill_in 'fixVersions-textarea', :with => task[:fixversion]
		click_link task[:fixversion]
		
		fill_in 'assignee-field', :with => task[:person]
		click_link task[:person]

		fill_in 'description', :with => task[:description]

		sleep 2

		click_button 'Create'
		sleep 2
		puts task['name']
	end
end

sleep 6