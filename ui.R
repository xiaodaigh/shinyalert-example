library(shiny)

shinyalert <- function(id,attachToID,HTMLtext = "Alert!") {	#hot standsfor handsontable
	shiny::tagList(
		singleton(tags$head(tags$script(src="shinyalerts.js")))
		,shiny::HTML(
			paste(
			'<div id="'
				, id
				, '" class="shinyalert alert alert-success hide fade out" data-alert="alert">' 
				, HTMLtext
				, '</div>'
			,sep="")
		)
		,tags$script(paste(
			"$(document).on('click','#"
			,attachToID
			,"',function() {var el = $('#"
			,id
			,"'); el.addClass('in');el.fadeIn()"			
			,"})"
			,sep="")
			
		)
	)
}

# Define UI for application that plots random distributions 
shinyUI(basicPage(
  # Application title
  headerPanel("Shiny alerts")
  ,actionButton("actionButton1","Press to show an alert")
  #show this alert when a button is pressed
  ,shinyalert("actionButton_alert","actionButton1","You pressed the button!") 
))
