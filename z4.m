MapLatLimit = [41 48];
MapLonLimit = [-74 -66];

NEstates = shaperead('usastatelo', 'UseGeoCoords', true, ...
   'BoundingBox', [MapLonLimit' MapLatLimit']);
axesm('MapProjection', 'eqaconic', 'MapParallels', [],...
  'MapLatLimit', MapLatLimit, 'MapLonLimit', MapLonLimit,...
  'GLineStyle', '-')
geoshow(NEstates, 'DisplayType', 'polygon', 'FaceColor','green')

maxdensity = max([NEstates.PopDens2000])
fall = flipud(autumn(numel(NEstates)));
densityColors = makesymbolspec('Polygon', {'PopDens2000', ...
   [0 maxdensity], 'FaceColor', fall});
geoshow(NEstates, 'DisplayType', 'polygon', ...
   'SymbolSpec', densityColors)
title ({'Population Density in New England in 2000', ...
   'in Persons per Square Mile'})

