{smcl}
{* 14May2024}{...}
{hi:help geoquery}{...}
{right:{browse "https://github.com/asjadnaqvi/Stata-clipgeo":clipgeo v2.1 (GitHub)}}

{hline}

{title:GEOQUERY (beta)}

{cmd:geoquery} is an intermediate program that calculates the summary statistics of the shapefile and stores them as locals. 
These values can be passed on to {stata help clippolygon:clippolygon} or {stata help clippolyline:clippolyline}.


{marker syntax}{title:Syntax}

Make sure the attributes files is loaded before using {cmd:geoquery}. For example, if we have {it:mydata.dta} and {it:mydata_shp.dta}, 
then we want to map variables from {it:mydata.dta} using {it:mydata_shp.dta} where {it:mydata_shp.dta} is the file we want to clip.

{p 8 15 2}
{cmd:geoquery} {it:shapefile} [if] [in], [{cmdab:off:set}({it:num})]


{synoptset 36 tabbed}{...}
{synopthdr}
{synoptline}

{p2coldent : {opt geoquery} {it:shapefile}}The {it:shapefile} must be a valid shapefile generated by Stata's {stata help spshape2dta:spshape2dta}, otherwise the program will break.{p_end}

{p2coldent : {opt off:set(value)}}Offset defines the how much the box needs to shrink or expand in size. The default value is set at 0 (no change in box size). If we set {it:offset(0.1)} then it implies that bounds on the axes are increased by 
{it:delta = (max - min) * 0.1}, or 10% of the axis extent. A negative value implies a reduction in the bounds. 
The x- and y-axis extents are calculated separately, such that the new bounds are, 
{it:xmin = xmin + xdelta, xmax = xmax - xdelta} for the x-axis. Simiarly, {it:yxmin = ymin + ydelta, ymax = ymax - ydelta} for the y-axis. {p_end}
{synoptline}
{p2colreset}{...}

{p 4 4 2}
After the command, relevant values are stored in e-class locals. Type {cmd:{it:return list}} to view the estimates.



{title:Psuedo code}

{it:Load the main file}
. use myfile.dta, clear

{it:Query the corresponding shapefile, using conditions and offset}
. geoquery myfile_shp if id==X, offset(0.3)

{it:Display the bounds (optional)}
. return list
. di "`e(bounds)'"

{it:Pass the bounds to the clipolygon or clipolyline command}
. clippolygon myfile_shp, box("`e(bounds)'")

{it:Test the mapped values}
. spmap _ID using myfile_shp_clipped, id(_ID)


See {browse "https://github.com/asjadnaqvi/stata-clipgeo":GitHub} for actual examples.

{hline}


Keywords: Stata, graphs, maps, query, shapefile
Version: {bf:geoquery} version 2.1
This  release: 14 May 2024
First release: 31 Jul 2022
License: {browse "https://opensource.org/licenses/MIT":MIT}

Author: {browse "https://github.com/asjadnaqvi":Asjad Naqvi}
E-mail: asjadnaqvi@gmail.com
Twitter: {browse "https://twitter.com/AsjadNaqvi":@AsjadNaqvi}




{title:Feedback}

Please submit bugs, errors, feature requests on {browse "https://github.com/asjadnaqvi/stata-clipgeo/issues":GitHub} by opening a new issue.

{title:References}

{p 4 8 2}Jann, B. (2018). {browse "https://www.stata-journal.com/article.html?article=gr0075":Color palettes for Stata graphics}. The Stata Journal 18(4): 765-785.

{p 4 8 2}Jann, B. (2022). {browse "https://ideas.repec.org/p/bss/wpaper/43.html":Color palettes for Stata graphics: an update}. University of Bern Social Sciences Working Papers No. 43. 


{title:Other visualization packages}

{psee}
    {helpb arcplot}, {helpb alluvial}, {helpb bimap}, {helpb bumparea}, {helpb bumpline}, {helpb circlebar}, {helpb circlepack}, {helpb clipgeo}, {helpb delaunay}, {helpb joyplot}, 
	{helpb marimekko}, {helpb polarspike}, {helpb sankey}, {helpb schemepack}, {helpb spider}, {helpb streamplot}, {helpb sunburst}, {helpb treecluster}, {helpb treemap}, {helpb waffle}

