#' Info UI Function
#'
#' @description Info Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_Info_ui <- function(id) {
  ns <- NS(id)

  tagList(
    fluidRow(
      column(width = 8,
             bs4Card(title = div("Stress in Action", style='color:black; font-size:18px;'), align="justify",
                     id = "sia_info", width = NULL, height = "1250px", inline = F, collapsible = F, maximizable = F,
                     p("Every person is familiar with stress as an integral part of our modern-day society. Think, for example, about the impact
                              of our ongoing 24-hour economy, the continuous online connectivity, social inequality or disadvantageous life
                              circumstances for some citizens, and the intensive combination of a work role with other social (family, friends) roles.
                              Think, more acutely, about the ongoing Covid-19 pandemic that has disrupted the world’s health and long-term care
                              systems, economic vitality, and social and community structures as a result of the concerns about our own health and
                              those of our loved ones, together with the disruptions of the social fabric caused by the required containment
                              measures (‘lock-down’). These are extraordinary times in which stress looms even larger in citizen’s lives."),
                     p("Stress-in-Action capitalizes on the fast advances in technology and big data analytics to move stress
                              research from the lab to daily life. A theoretical framework of daily-life stress will be developed using the novel insights
                              from ambulatory assessments in large, long-running Dutch cohorts and from experimental validation studies. This
                              generates novel, mechanistic understanding of 1) how responses to daily-life stress arise from the temporal, dynamic
                              interplay between context and person-specific factors, 2) how daily-life stress can be reliably measured in a specific
                              individual in real-time, and 3) how and when potential beneficial stress-response mechanisms turn into detrimental
                              effects on mental and cardiometabolic health. This will enable the development of novel monitoring and intervention
                              strategies to track and reduce daily-life stress and its health impact."),
                     p(strong("The Stress-in-Action consortium unites and consolidates the expertise of multiple renowned Dutch researchers active in (daily-life) stress research
                              but who come from different disciplines within five universities (Amsterdam UMC, Erasmus University Rotterdam, University of Groningen, University of Twente, VU University Amsterdam."), style = "color: #1c75bc"),
                     p("Wearables are particularly relevant for measuring activity of the major
                              physiological stress systems, which are considered the core pathways leading from stress to organ damage including
                              the brain, and hence to cardiometabolic and mental disease. Capitalizing on the fast advances in wearable sensor
                              technology and big data analytics, Stress-in-Action will develop, integrate, and validate cutting-edge, user-friendly
                              assessment tools to quantify the continuous and dynamic daily-life stress response, so that we can move stress
                              research from the lab to daily life."),
                     p(img(src = "www/sia_grav_image_person.png",  width = "30%"), br(),
                       strong("Illustration of ambulatory assessment tools in daily life"), align="center"),
                     p("The Stress in Action Wearable Team has thoroughly tested and validated multiple wearbales. This wearables App represents the database containing
                              non-invasive wearable monitors that can record aspects of autonomic nervous system activity. For each
                              wearable, comprehensive technical and data specifications (such as details on recorded signals,
                              parameters, battery life, raw data access) are provided along with findings from a systematic search of
                              papers investigating the validity of parameters provided by a wearable (or previous version), reliability,
                              and user-friendliness.")
             )
      ),
      column(width = 4,
             bs4Card(title = div("Updates", style='color:black; font-size:18px;'), id = "sia_updates",
                     style="width:1200px;overflow-y: scroll;height:1250px;", collapsible = F, maximizable = F,
                     width = NULL,  height = "1250px", align="justify",
                     p(strong("November 2024", style = "color: #f15a29; font-size:22px")),
                     p("First version online", br(),
                       "- Filter tools", br(),
                       "- Data download")
             )
      )
    )
  )
}

#' Info Server Functions
#'
#' @noRd
mod_Info_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns

  })
}

## To be copied in the UI
# mod_Info_ui("Info_1")

## To be copied in the server
# mod_Info_server("Info_1")
