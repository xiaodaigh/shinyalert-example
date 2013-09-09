library(shiny)

# this shiny alert will show when something is clicked
shinyalert.onclick <- function(id,attachToID,HTMLtext = "Alert!") {	
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


# this shiny alert will show when you call the function showShinyAlert(id) in your server.R code inside a reactive environment
shinyalert <- function(id,HTMLtext = "Alert!") {	
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
			"Shiny.addCustomMessageHandler('"
				,id
				,"', function(data) {
			   var el = $('#"
			   	,id
			   	,"'); el.addClass('in'); el.text(data); el.fadeIn()
			 });
			"
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
  ,shinyalert("actionButton_alert","You pressed the button! Now Press this banner to close it") 
))
