% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cat_gifs.R
\name{cat_gifs}
\alias{cat_gifs}
\title{Concatenate GIFs}
\usage{
cat_gifs(paths, output = "output.gif")
}
\arguments{
\item{paths}{A vector of paths to \code{.gif} files.}

\item{output}{A path where the GIF will be written.}
}
\description{
Concatenate GIFs
}
\examples{
\dontrun{

library(ggplot2)
library(gganimate)
library(tibble)
library(dplyr)

mt_animate <- mtcars \%>\%
  tibble::as_tibble() \%>\%
  dplyr::mutate(Row = row_number())

part1 <-  mt_animate \%>\%
 dplyr::filter(Row < 17)

part2 <-  mt_animate \%>\%
  dplyr::filter(Row >= 17)

temp_dir <- tempdir()

part1 \%>\%
  ggplot(aes(mpg, hp)) +
  geom_point() +
  labs(title = 'Row: {frame_time}') +
  transition_time(Row) +
  ease_aes('linear')

anim_save(filename = file.path(temp_dir, "part1.gif"))

part2 \%>\%
  ggplot(aes(mpg, hp)) +
  geom_point() +
  labs(title = 'Row: {frame_time}') +
  transition_time(Row) +
  ease_aes('linear')

anim_save(filename = file.path(temp_dir, "part2.gif"))

cat_gifs(
  c(file.path(temp_dir, "part1.gif"),
    file.path(temp_dir, "part2.gif"))
)

}
}
