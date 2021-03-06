% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tm_view.R
\name{tm_view}
\alias{tm_view}
\title{Options for the interactive tmap viewer}
\usage{
tm_view(alpha, colorNA, basemaps, basemaps.alpha, base.groups = NA,
  overlay.groups = NA, projection, symbol.size.fixed, dot.size.fixed,
  text.size.variable, bbox, set.bounds, set.view, set.zoom.limits,
  view.legend.position, control.position, popup.all.data, bg.overlay,
  bg.overlay.alpha, legend.position)
}
\arguments{
\item{alpha}{transparency (opacity) parameter applied to whole map. By default, it is set to \code{0.7} if basemaps are used, and \code{1} otherwise.}

\item{colorNA}{default color for missing values in interactive mode. If the color of missing values is not defined in the layer functions (e.g. \code{\link{tm_fill}}), then the default color is taken from the \code{na} value of the \code{aes.color} argument in \code{\link{tm_layout}}. This \code{colorNA} argument (if not \code{NA} itself) overrides that default value. For interactive maps, it can be useful to set \code{colorNA} to \code{NULL}, which means transparent.}

\item{basemaps}{vector of one or more names of baselayer maps, or a logical value. See \url{http://leaflet-extras.github.io/leaflet-providers/preview}. Also supports URL's for tile servers, such as \code{"http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"}. The default value for \code{basemaps} is style dependent. For the default style \code{"white"}, it is \code{c("CartoDB.Positron", "OpenStreetMap", "Esri.WorldTopoMap")}. Use \code{TRUE} to select a large set of recommended basemaps. Use \code{FALSE} to omit basemap tiles. If a named vector is provided, the names are used in the layer control legend. Basemaps can also be set with \code{\link{tm_basemap}}).}

\item{basemaps.alpha}{transparency (opacity) value for the basemaps. Can be a vector of values, one for each basemap.}

\item{base.groups}{group names that are plotted as base layers. Groups names are defined in the element functions (e.g. \code{\link{tm_symbols}}).}

\item{overlay.groups}{group names that are plotted as overlay layers. Groups names are defined in the element functions (e.g. \code{\link{tm_symbols}}).}

\item{projection}{projection. Either a EPSG number, or a \code{leaflet_crs} object created with \code{\link[leaflet:leafletCRS]{leafletCRS}}. By default, the Web Mercator (3857) is used, since the vast majority of basemaps are rendered accordingly. Other standards are EPSG numbers 4326 (WGS84) and 3395 (Mercator). If set to 0, the projection of the master shape is used (see \code{\link{tm_shape}}) provided that a EPSG number can be extracted.}

\item{symbol.size.fixed}{should symbol sizes be fixed while zooming?}

\item{dot.size.fixed}{should dot sizes be fixed while zooming?}

\item{text.size.variable}{should text size variables be allowed in view mode? By default \code{FALSE}, since in many applications, the main reason to vary text size is to prevent occlusion in plot mode, which is often not a problem in view mode due to the ability to zoom in.}

\item{bbox}{bounding box. One of the following:
\itemize{
\item A bounding box (an \code{sf} bbox object, see \code{\link[sf:st_bbox]{st_bbox}}, a 2 by 2 matrix (used by the \code{sp} package), or an \code{\link[raster:Extent]{Extent}} object used by the \code{raster} package). 
\item Open Street Map search query. The bounding is automatically generated by querying \code{q} from Open Street Map Nominatim. See \url{http://wiki.openstreetmap.org/wiki/Nominatim}.}
If set, it overrides \code{set.view} and all bbox arguments of \code{\link{tm_shape}}.}

\item{set.bounds}{logical that determines whether maximum bounds are set, or a numeric vector of four values that specify the lng1, lat1, lng2, and lat2 coordinates (see \code{\link[leaflet:setMaxBounds]{setMaxBounds}}).}

\item{set.view}{numeric vector that determines the view. Either a vector of three: lng, lat, and zoom, or a single value: zoom. See \code{\link[leaflet:setView]{setView}}. Only applicable if \code{bbox} is not specified}

\item{set.zoom.limits}{numeric vector of two that set the minimum and maximum zoom levels (see \code{\link[leaflet:tileOptions]{tileOptions}}).}

\item{view.legend.position}{Character vector of two values, specifing the position of the legend. Use "left" or "right" for the first value and "top" or "bottom" for the second value. It overrides the value of \code{legend.position} of \code{\link{tm_layout}}, unless set to \code{NA}.}

\item{control.position}{Character vector of two values, specifing the position of the layer control UI. Use "left" or "right" for the first value and "top" or "bottom" for the second value.}

\item{popup.all.data}{not used anymore. As of version 1.6, the popups are specified by the argument \code{popup.vars} in the layer functions \code{\link{tm_fill}}, \code{\link{tm_symbols}}, and \code{\link{tm_lines}}.}

\item{bg.overlay}{not used anymore as of version 1.7. Instead of an overlay, a background color is set, which is determined by \code{bg.color} of \code{\link{tm_layout}}, which is style dependent.}

\item{bg.overlay.alpha}{not used anymore as of version 1.7. Instead of an overlay, a background color is set. The trade-off between background and basemaps can now be set by \code{basemaps.alpha}}

\item{legend.position}{not used anymore, renamed to view.legend.position}
}
\description{
Set the options for the interactive tmap viewer. Some of these options can also be set with \code{\link{tm_layout}}, since they are style dependent (e.g., the choice of basemaps). The function \code{tm_view} overrides these options when specified.
}
\examples{
# world choropleth/bubble map of the world
data(World, metro)
metro$growth <- (metro$pop2020 - metro$pop2010) / (metro$pop2010 * 10) * 100

map1 <- tm_shape(metro) +
	tm_bubbles("pop2010", col = "growth", 
		border.col = "black", border.alpha = .5, 
		style="fixed", breaks=c(-Inf, seq(0, 6, by=2), Inf),
		palette="-RdYlBu", contrast=1, 
		title.size="Metro population", 
		title.col="Growth rate (\%)", id="name", 
		    popup.vars=c("pop2010", "pop2020", "growth")) + 
	tm_legend(outside=TRUE)

current.mode <- tmap_mode("plot")

# plot map
map1

# view map with default view options
tmap_mode("view")
map1

# view map with changed view options
map1 + tm_view(alpha = 1, basemaps = "Stamen.Watercolor")

# restore current mode
tmap_mode(current.mode)
}
\references{
Tennekes, M., 2018, {tmap}: Thematic Maps in {R}, Journal of Statistical Software, 84(6), 1-39, \href{https://doi.org/10.18637/jss.v084.i06}{DOI}
}
\seealso{
\code{\link{tmap_mode}} and \href{../doc/tmap-modes.html}{\code{vignette("tmap-modes")}}
}
