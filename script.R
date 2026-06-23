################################################################################
# Script: generate_acknowledgement_page.R
# Purpose: Create a visually appealing HTML page with acknowledgements,
#          references, and professional profile links for QR code sharing.
# Author: Samira Salimiyan
# Date: 2026-06-22
################################################################################

# Load required library
library(htmltools)

# === USER INFORMATION ===
lab_name <- "Graff Lab"
name <- "Samira Salimiyan"
title <- "PhD Student, Biomedical Sciences | Graduate Certificates in Computational Biology & Neuroscience"

linkedin <- "https://www.linkedin.com/in/samira-salimiyan"
researchgate <- "https://www.researchgate.net/profile/Samira-Salimiyan-2?ev=hdr_xprf"
github <- "https://github.com/Samira0250"
supplementary_link <- "https://YOUR-SUPPLEMENTARY-FILE-LINK"

# === PAGE CONTENT ===
acknowledgements <- "
The authors would like to thank the staff at the <b>Scott-Ritchey Research Center</b>, 
specifically <b>Jessica Cannon</b> and <b>Dr. Stephanie Maples</b>. Funding was provided in 
part through support from the <b>Scott-Ritchey Research Center</b>, the 
<b>Animal Health and Disease Research Program</b>, and a grant from the 
<b>Auburn University Research Support Program</b>. 
Special thanks to the <b>Department of Pathobiology</b> and 
the <b>Computational Biology Program</b> at Auburn University for providing research 
resources and inspiration.

<br><br>

Figures were created with <b>BioRender.com</b>. Data analysis and visualization were 
performed using <b>R</b> (v4.5.1) with packages including ggplot2, tidyverse, and qrcode. 
Statistical analyses were conducted using <b>GraphPad Prism 10</b>. 

Cell-type deconvolution was performed using <b>RnaXtract</b>, 
<b>CIBERSORTx</b> (Stanford University), and <b>HIDE</b> 
(Hierarchical cell-type Deconvolution). Human scRNA-seq reference data were obtained from 
the <b>Allen Brain Atlas</b>. 

Feline snRNA-seq reference data were derived from the publicly available dataset described in the bioRxiv preprint:  
“Single Cell Multiomics Across Nine Mammals Reveals Cell Type Specific Regulatory Conservation in the Brain”  
(Anderson et al., 2025; 
<a href='https://doi.org/10.1101/2025.08.06.668931' target='_blank'>
https://doi.org/10.1101/2025.08.06.668931
</a>).
"

references <- "
<ol>
<li>
Graff EC et al. (2020) PEA15 loss of function and defective cerebral development in the domestic cat. 
PLoS Genetics 16(12):e1008671. 
</li>

<li>
Völkl D et al. (2025) HIDE: hierarchical cell-type deconvolution. 
Bioinformatics 41(Suppl 1):i207–i216.
</li>

<li>
Bouirdene SG et al. (2025) RnaXtract, a tool for extracting gene expression, variants, and cell-type composition from bulk RNA sequencing. 
Scientific Reports 15:31100.
</li>
</ol>
"

# === ICONS ===
linkedin_icon <- tags$i(class = "fab fa-linkedin fa-lg", style = "color:#0077b5;")
rg_icon <- tags$i(class = "fab fa-researchgate fa-lg", style = "color:#00ccbb;")
github_icon <- tags$i(class = "fab fa-github fa-lg", style = "color:#333;")
supp_icon <- tags$i(class = "fas fa-file-alt fa-lg", style = "color:#555;")

# === HTML STRUCTURE ===
page <- tags$html(
  tags$head(
    tags$title("Acknowledgements & References - Samira Salimiyan"),
    
    tags$link(
      rel = "stylesheet",
      href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"
    ),
    
    tags$style(HTML("
      body {
        font-family: 'Segoe UI', Arial, sans-serif;
        background: #f9f9fb;
        color: #333;
        max-width: 780px;
        margin: 40px auto;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
        font-size: 18px;
        line-height: 1.6;
      }
      
      h1, h2 { color: #2c3e50; }
      
      h1.lab-header {
        text-align: center;
        color: #d35400;
        font-size: 2em;
        margin-bottom: 10px;
      }
      
      h3 {
        color: #555;
        font-weight: 400;
        text-align: center;
        margin-bottom: 30px;
      }
      
      .section { margin-bottom: 30px; }
      
      a {
        text-decoration: none;
        font-weight: 500;
        color: #0077b5;
      }
      
      .icons a {
        margin-right: 20px;
        font-size: 1.1em;
      }
      
      footer {
        margin-top: 40px;
        border-top: 1px solid #ddd;
        padding-top: 10px;
        font-size: 0.85em;
        color: #666;
        text-align: center;
      }
      
      ol { padding-left: 20px; }
      li { margin-bottom: 10px; }
    "))
  ),
  
  tags$body(
    tags$h1(class = "lab-header", lab_name),
    tags$h3(name),
    tags$h3(title),
    
    tags$div(class = "section",
             tags$h2("Acknowledgements"),
             tags$p(HTML(acknowledgements))
    ),
    
    tags$div(class = "section",
             tags$h2("References"),
             HTML(references)
    ),
    
    tags$div(class = "section icons",
             tags$h2("Connect with Me"),
             
             tags$a(href = linkedin, target = "_blank", linkedin_icon, " LinkedIn"),
             tags$br(),
             
             tags$a(href = researchgate, target = "_blank", rg_icon, " ResearchGate"),
             tags$br(),
             
             tags$a(href = github, target = "_blank", github_icon, " GitHub"),
             tags$br(),
             
             tags$a(href = supplementary_link, target = "_blank", supp_icon, " Supplementary Materials")
    ),
    
    tags$footer(paste0("© ", format(Sys.Date(), "%Y"), " ", name))
  )
)

# === WRITE HTML FILE ===
save_html(page, file = "~/Downloads/Acknowledgements_SamiraSalimiyan.html")

cat("✅ HTML page generated successfully: 'Acknowledgements_SamiraSalimiyan.html'\n")
cat("You can now upload it and create a QR code linking to it.\n")
