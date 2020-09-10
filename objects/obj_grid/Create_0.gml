cellWidth = 16;
cellHeight = 16;
hCells = room_width div cellWidth;
vCells = room_height div cellHeight;

global.grid = mp_grid_create(0, 0, hCells, vCells, cellWidth, cellHeight);
mp_grid_add_instances(global.grid, obj_wall, false);

global.gridBoss = mp_grid_create(0, 0, hCells, vCells, cellWidth, cellHeight);
mp_grid_add_instances(global.gridBoss, obj_wall, false);