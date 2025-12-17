required_packages <- c(
  "caret",
  "rpart",
  "rpart.plot",
  "dplyr"
)

installed <- rownames(installed.packages())
for (pkg in required_packages) {
  if (!pkg %in% installed) {
    install.packages(pkg, dependencies = TRUE)
  }
}
