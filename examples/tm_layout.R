data(World, land)

tm_shape(World) + 
    tm_fill("pop_est_dens", style="kmeans", title="Population density") +
tm_format("World", title="The World") + tm_style_albatross(frame.lwd=10)

\dontrun{
tm_shape(land) +
	tm_raster("elevation", breaks=c(-Inf, 250, 500, 1000, 1500, 2000, 2500, 3000, 4000, Inf),  
		palette = terrain.colors(9), title="Elevation", auto.palette.mapping = FALSE) +
tm_shape(World, is.master=TRUE) +
	tm_borders("grey20") +
	tm_grid(projection="longlat", labels.size = .5) +
	tm_text("name", size="AREA") +
tm_compass(position = c(.65, .15), color.light = "grey90") +
tm_credits("Eckert IV projection", position = c("right", "BOTTOM")) +
tm_layout(inner.margins=c(.04,.03, .02, .01), 
	earth.boundary = TRUE, 
	space.color="grey90") +
tm_style("classic", bg.color="lightblue") +
tm_legend(position = c("left", "bottom"), 
	frame = TRUE,
	bg.color="lightblue")
}
	
WorldOne <- rgeos::gUnaryUnion(World)
tm_shape(World, projection="robin") +
	tm_fill("HPI", palette="div", auto.palette.mapping = FALSE, n=7, 
			title = "Happy Planet Index") +
tm_shape(WorldOne) + 
	tm_borders() +
	tm_grid(projection = "longlat") +
tm_credits("Winkel Tripel projection", position = c("right", "BOTTOM")) +
tm_style("natural", earth.boundary = c(-180, -87, 180, 87), inner.margins = .05) +
tm_legend(position=c("left", "bottom"), bg.color="grey95", frame=TRUE)

\dontrun{
# global option tmap.style demo
	
# get current style
current.style <- tmap_style() 
	
qtm(World, fill="economy", format="World")

tmap_style("col_blind")
qtm(World, fill="economy", format="World")

tmap_style("cobalt")
qtm(World, fill="economy", format="World")

# set to current style
tmap_style(current.style)
}

# TIP: check out these examples in view mode, enabled with tmap_mode("view")
