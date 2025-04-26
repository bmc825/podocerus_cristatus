
# Function to generate plots for predictors
generate_posterior_plot <- function(
  posterior_samples,
  regex_pars,
  custom_labels,
  expand = c(0.2, 0),
  axis_title_y = TRUE,
  axis_title_x = TRUE,
  axis_text_x = TRUE,
  x_axis_title = NULL,
  x_range = c(-5, 5)
) {
  # Define the levels of the y-axis based on custom_labels order
  levels_order <- names(custom_labels)

  mcmc_areas(
    posterior_samples,
    regex_pars = regex_pars,
    prob = 0.85, 
    prob_outer = 0.95
  ) +
    scale_y_discrete(
      limits = levels_order,
      labels = custom_labels,
      expand = expansion(mult = expand)
    ) +
    scale_x_continuous(limits = x_range) +
    geom_vline(xintercept = 0, linetype = 3, color = "red", size = 0.6) +
    labs(x = if (axis_title_x) x_axis_title else NULL) +  # ✅ Apply axis title
    theme_bw(base_size = 8) +
    theme(
      axis.title.y = if (axis_title_y) element_text() else element_blank(),
      axis.text.y = if (axis_title_y) element_text(size = 8) else element_blank(),
      axis.text.x = if (axis_text_x) element_text(size = 8) else element_blank(),
      axis.title.x = if (axis_title_x) element_text() else element_blank(),
      panel.grid.major.x = element_blank(),
      panel.grid.minor.x = element_blank(),
      plot.margin = margin(0, 0, 0, 0)
    )
}



# Function to generate trace plots for predictors
generate_trace_plot <- function(model, regex_pars, 
                                axis_title_y = TRUE, axis_text_x = TRUE,
                                y_label = "Value of parameter", plot_title = NULL, 
                                axis_title_size = 10, axis_text_size = 8) {
  mcmc_trace(
    model,
    regex_pars = regex_pars
  ) +
    theme_bw(base_size = 8) +
    labs(
      title = plot_title,
      y = if (axis_title_y) y_label else NULL
    ) +
    theme(
      axis.title.x = if (axis_text_x) element_text(size = axis_title_size) else element_blank(),
      axis.title.y = if (axis_title_y) element_text(size = axis_title_size) else element_blank(),
      axis.text.x  = if (axis_text_x) element_text(size = axis_text_size) else element_blank(),
      axis.text.y  = if (axis_title_y) element_text(size = axis_text_size) else element_blank(),
      panel.grid.major.x = element_blank(),
      panel.grid.minor.x = element_blank(),
      plot.margin = margin(0, 0, 0, 0),
      legend.position = "none"
    )
}




# Function to generate posterior predictive plots for predictors
generate_pp_check <- function(
  model, 
  nreps = 100, 
  axis_title_y = TRUE,
  y_label = "Density", 
  plot_title = NULL,
  axis_title_size = 10, 
  axis_text_size = 8
) {
  pp_check(model, nreps = nreps) +
    theme_bw(base_size = 8) +
    labs(
      title = plot_title,
      y = if (axis_title_y) y_label else NULL
    ) +
    scale_x_continuous(expand = expansion(mult = c(0.01, 0.02))) +
    coord_cartesian(clip = "off") +
    theme(
      axis.title.y = if (axis_title_y) element_text(size = axis_title_size) else element_blank(),
      axis.text.y  = if (axis_title_y) element_text(size = axis_text_size) else element_blank(),
      axis.title.x = element_text(size = axis_title_size),
      axis.text.x  = element_text(size = axis_text_size),
      panel.grid.major.x = element_blank(),
      panel.grid.minor.x = element_blank(),
      legend.position = "none"
    )
}



# Function to transform predictor values on log scale to original scale
transform_posteriors <- function(data, variables) {
    # Check if variables exist in the data
    missing_vars <- setdiff(variables, names(data))
    if (length(missing_vars) > 0) {
        stop(paste("The following variables are missing from the data:", paste(missing_vars, collapse = ", ")))
    }
    
    # Transform existing variables and return the updated data
    data <- data %>%
        mutate(across(all_of(variables), exp, .names = "{.col}_original"))
    
    # Explicitly return the modified data
    return(data)
}


# Create a grey bar function
create_top_bar <- function(label, fontsize = 10) {
  grid::gTree(
    children = grid::gList(
      grid::rectGrob(gp = grid::gpar(fill = "grey90", col = NA), height = unit(2, "lines")),
      grid::textGrob(label, gp = grid::gpar(fontsize = fontsize), y = 0.5)
    )
  )
}

# Function to generate a pretty table
generate_kable <- function(data, caption) {
    if (nrow(data) == 0) stop("Input data is empty. Please check the input table.")
    
    data %>%
        kbl(caption = caption, booktabs = TRUE, align = "lcccccc") %>%
        kable_styling(
            full_width = FALSE,
            position = "center",
            stripe_color = NULL,
            latex_options = c("hold_position")
        ) %>%
        row_spec(0, bold = TRUE, color = "black", background = "white") %>%
        row_spec(1:nrow(data), background = "white") %>%
        column_spec(1, width = "10em") %>%
        column_spec(2, width = "10em") %>%
        column_spec(3, width = "8em") %>%
        column_spec(4, width = "8em") %>%
        column_spec(5, width = "8em") %>%
        column_spec(6, width = "8em")
}


## Minimal function to convert a data frame into plain HTML table
minimal_html_table <- function(df, caption = "") {
  # Start table with basic styling
  html <- "<table style='border-collapse: collapse; border: 1px solid black; width: 100%;'>"
  
  # Optional caption
  if (nzchar(caption)) {
    html <- paste0(
      html,
      "<caption style='caption-side: top; font-weight: bold; text-align: left; margin-bottom: 5px;'>",
      caption, 
      "</caption>"
    )
  }
  
  # Table header
  html <- paste0(html, "<thead><tr>")
  for (colname in colnames(df)) {
    html <- paste0(
      html,
      "<th style='border: 1px solid black; padding: 5px;'>",
      colname,
      "</th>"
    )
  }
  html <- paste0(html, "</tr></thead>")

  # Table body
  html <- paste0(html, "<tbody>")
  for (i in seq_len(nrow(df))) {
    html <- paste0(html, "<tr>")
    for (colname in colnames(df)) {
      val <- df[[colname]][i]
      html <- paste0(
        html,
        "<td style='border: 1px solid black; padding: 5px;'>",
        val,
        "</td>"
      )
    }
    html <- paste0(html, "</tr>")
  }
  html <- paste0(html, "</tbody></table>")
  
  return(html)
}