% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/trackCollEvents.R
\name{createCollEvents}
\alias{createCollEvents}
\title{Identify collective events from objects in the current frame}
\usage{
createCollEvents(
  inDT,
  inEps = 1,
  inMinPts = 1L,
  inClOffset = 0L,
  inCols = list(x = "x", y = NULL, z = NULL, frame = "time", id = "trackID", collid =
    "clTrackID"),
  inDeb = T
)
}
\arguments{
\item{inDT}{a data.table with time series in the long format.}

\item{inEps}{a float with the search radius, default 1.}

\item{inMinPts}{an integer with the minimum size of the cluster, default 1L.}

\item{inClOffset}{an integer with an offset that corresponds to the max cluster number identified in previous frames, default 0L.}

\item{inCols}{a list with column names, \code{list(frame = , x = , y = , z = , id = , collid = )}, that correspond to the frame number, position, track id's and id's of collective events, respectively.}

\item{inDeb}{logical, whether to output debug information.}
}
\value{
a data.table with cluster numbers and id's of the corresponding objects.
}
\description{
A helper function for the trackCollEvents function.
}
\examples{
require(data.table)
require(ggplot2)

dtIn <- data.table(
  time = rep(0, 5),
  id = 1:5,
  x = c(1:3, 5:6))

dtCalc <- ARCOS::createCollEvents(dtIn,
                                  inCols = list(
                                    x = "x",
                                    y = NULL,
                                    z = NULL,
                                    frame = "time",
                                    id = "id",
                                    collid = "collid"
                                  ),
                                  inEps = 1.01, inMinPts = 1,
                                  inClOffset = 0,
                                  inDeb = F)

ggplot(dtCalc,
       aes(x = x,
           y = time)) +
  geom_point(aes(color = as.factor(id),
                 shape = as.factor(collid)),
             size = 2) +
  scale_color_discrete("Object id:") +
  scale_shape_discrete("Collective id:") +
  theme_bw()

}
