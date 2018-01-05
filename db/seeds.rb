3.times do |event|
	Event.create!(
		title: "Blah blah #{event}",
		description: "asdfasdfasdf",
		main_image: "asdfasdfasdf",
		date: "2/12/18",
    time: "2:30 pm",
    location: "asdfasfdasfd"
		)
end