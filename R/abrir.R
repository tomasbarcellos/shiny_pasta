#' Abrir shiny
#'
#' @return um app shiny
#' @export
abrir_app <- function() {
  meuwd <- getwd()
  ui <- shiny::fluidPage(
    shiny::actionButton("pasta", "Criar uma pasta"),
    shiny::verbatimTextOutput("saida")
  )

  server <- function(input, output, session) {
    output$saida <- shiny::renderPrint({
      input$pasta

      print(meuwd)
      # Arquivos
      print(dir())
    })

    shiny::observeEvent(input$pasta, {
      dir.create(paste0(meuwd, "/pasta", round(rnorm(1) * 100)))
    })
  }

  shiny::shinyApp(ui, server)
}
