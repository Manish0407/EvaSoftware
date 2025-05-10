import React, { useMemo } from "react";
import { Group, Line } from "react-konva";

const Grid = ({
  children,
  windows,
  gridSize = 100,
  gridColor = "#c0c2c4",
  gridStrokeWidth = 1,
  stageWidth,
  stageHeight,
}) => {
  const gridLines = useMemo(() => {
    const lines = [];

    const centerX = windows.width / 2;
    const centerY = windows.height / 2;

    const gridWidth = Math.max(windows.width * 2, 3000);
    const gridHeight = Math.max(windows.height * 2, 3000);

    for (let x = centerX - gridWidth / 2; x <= centerX + gridWidth / 2; x += gridSize) {
      lines.push(
        <Line
          key={`vLine-${x}`}
          points={[x, centerY - gridHeight / 2, x, centerY + gridHeight / 2]}
          stroke={gridColor}
          strokeWidth={gridStrokeWidth}
          listening={false}
        />
      );
    }

    for (let y = centerY - gridHeight / 2; y <= centerY + gridHeight / 2; y += gridSize) {
      lines.push(
        <Line
          key={`hLine-${y}`}
          points={[centerX - gridWidth / 2, y, centerX + gridWidth / 2, y]}
          stroke={gridColor}
          strokeWidth={gridStrokeWidth}
          listening={false}
        />
      );
    }

    return lines;
  }, [gridSize, gridColor, gridStrokeWidth, stageWidth, stageHeight, windows.width, windows.height]);

  return (
    <Group>
      {gridLines}
      {children}
    </Group>
  );
};

export default Grid;