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

location = 'Sea'
fixvers = 'sisters_1680'
fifthtab = 'sisters_1700'
sixthtab = 'sisters_1710'
countdown = 'sisters_1740'

tasks = [
	{ 'name' => 'SL ' + location + ' UI: Home Page', :first => 'sross', :fixversion => fixvers},
	{ 'name' => 'SL ' + location + ' UI: Puzzle Image', :person => 'sross', :fixversion => fixvers},
	{ 'name' => 'SL ' + location + ': Achievement Badge', :person => 'hlee', :fixversion => fixvers},
	{ 'name' => 'SL ' + location + ' UI: Carol Image', :person => 'sross', :fixversion => fixvers},
	{ 'name' => 'SL ' + location + ': Crafting Test All Crafting Recipes', :person => 'jhale', :fixversion => fixvers},
	{ 'name' => 'SL ' + location + ': Philanthropy', :fixversion => fixvers},
	{ 'name' => 'SL ' + location + ': Socialize', :fixversion => fixvers},
	{ 'name' => 'SL ' + location + ': Flavor Text', :person => 'sross', :fixversion => fixvers},
	{ 'name' => 'SL ' + location + ': Socialize Locked tab text', :fixversion => fixvers},
	{ 'name' => 'SL ' + location + ': Socialize Tab Names', :person => 'sross', :fixversion => fixvers},
	{ 'name' => 'SL ' + location + ' UI: Study Abroad Guide', :person => 'sross', :fixversion => fixvers},
	{ 'name' => 'SL ' + location + ' Art: Tickets and Consumables', :fixversion => fixvers},
	{ 'name' => 'SL ' + location + ' Art: Crafting Swag', :fixversion => fixvers},
	{ 'name' => 'SL ' + location + ' Art: Hair (7)', :person => 'sross', :fixversion => fixvers},	
	{ 'name' => 'SL ' + location + ' Art: Eyewear (2)', :fixversion => fixvers},
	{ 'name' => 'SL ' + location + ' Art: Shoes (7)', :person => 'sross', :fixversion => fixvers},
	{ 'name' => 'SL ' + location + ' Art: Pets (4)', :person => 'sross', :fixversion => fixvers},
	{ 'name' => 'SL ' + location + ' Art: Neckwear (6)', :fixversion => fixvers},
	{ 'name' => 'SL ' + location + ' Art: Extras (5)', :person => 'sross', :fixversion => fixvers},
	{ 'name' => 'SL ' + location + ' Art: Bracelets (3)', :fixversion => fixvers},
	{ 'name' => 'SL ' + location + ' Art: Tights (2)', :person => 'sross', :fixversion => fixvers},
	{ 'name' => 'SL ' + location + ' Art: Casual (7)', :person => 'sross', :fixversion => fixvers},
	{ 'name' => 'SL ' + location + ' Art: Cocktail (7)', :person => 'sross', :fixversion => fixvers},
	{ 'name' => 'SL ' + location + ' Art: Formal (7)', :person => 'sross', :fixversion => fixvers},
	{ 'name' => 'SL ' + location + ' Art: Athletic (3)', :fixversion => fixvers},
	{ 'name' => 'SL ' + location + ' Art: Costumes (2)', :fixversion => fixvers},
	{ 'name' => 'SL ' + location + ' Art: BFs (2)', :fixversion => fixvers},
	{ 'name' => 'SL ' + location + ' Art: Rides (2)', :fixversion => fixvers},
	{ 'name' => 'SL ' + location + ': Virals', :fixversion => fixvers},
	{ 'name' => 'SL ' + location + ' UI: Viral Art', :person => 'sross', :fixversion => fixvers},
	{ 'name' => 'SL ' + location + ': 5th tab/Casino', :person => 'sross', :fixversion => fifthtab},
	{ 'name' => 'SL ' + location + ': 6th tab', :person => 'sross', :fixversion => sixthtab},
	{ 'name' => 'SL ' + location + ': Announcement', :person => 'sross', :fixversion => fixvers},
	{ 'name' => 'SL ' + location + ': Eng', :fixversion => fixvers},
	{ 'name' => 'SL ' + location + ': Location Countdown', :fixversion => countdown}
	
]


tasks.each do |task|
	click_link 'Create Issue'
	
		sleep 2
	#MUST BE FIRST
	if task[:first]
		page.execute_script "document.querySelector('#issuetype-single-select span').click()"
		page.execute_script "document.querySelector(\"#issuetype-suggestions li a[title='New Feature']\").click()"
		sleep 2

		fill_in 'summary', :with => task['name']

		fill_in 'fixVersions-textarea', :with => task[:fixversion]
		click_link task[:fixversion]

		fill_in 'assignee-field', :with=> task[:first]
		sleep 1
		
		puts [task:'name']

	click_button 'Create'
	

	#assign people tickets!
	elsif task[:person]
		click_link 'Create Issue'
		sleep 1
		
		fill_in 'summary', :with => task['name']

		fill_in 'fixVersions-textarea', :with => task[:fixversion]
		click_link task[:fixversion]

		fill_in 'assignee-field', :with=> task[:person]	
		
		puts [task:'name']

	click_button 'Create'

	sleep 1

	else
		click_link 'Create Issue'

		fill_in 'summary', :with => task['name']

		fill_in 'fixVersions-textarea', :with => task[:fixversion]
		click_link task[:fixversion]	

		click_button 'Create'
		
		puts [task:'name']
	
	end
end

sleep 5