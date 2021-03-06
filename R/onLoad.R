.onLoad <- function(...) {
	options(tmap.style="white", tmap.mode="plot")
	internet <- working_internet()
	assign(".internet", internet, envir = .TMAP_CACHE)
	assign(".underCoverage", NULL, envir = .TMAP_CACHE)
	assign(".overCoverage", NULL, envir = .TMAP_CACHE)
	assign(".last_map", NULL, envir = .TMAP_CACHE)
	assign(".last_map_new", NULL, envir = .TMAP_CACHE)
	assign(".tmapOptions", .defaultTmapOptions, envir = .TMAP_CACHE)
	assign(".tmapStyles", .defaultTmapStyles, envir = .TMAP_CACHE)
	assign(".tmapFormats", .defaultTmapFormats, envir = .TMAP_CACHE)
} 

.TMAP_CACHE <- new.env(FALSE, parent=globalenv())

.crs_longlat <- sf::st_crs(4326)
.crs_merc <- sf::st_crs(3857)

get_proj4_version <- function() {
	PROJ4_version <- rgdal::getPROJ4VersionInfo()
	vid <- gregexpr("PJ_VERSION: ", PROJ4_version, fixed = TRUE)[[1]][1] + 12
	as.integer(substr(PROJ4_version, vid, nchar(PROJ4_version)-1))
}
