import React from "react";
import { Group, Line, Rect } from "react-konva";

const DrawMesh = ({ width, height, type, padding }) => {
  const gridSize = 30;
  const strokeColor = "#333";
  const strokeWidth = 1;
  const verticalLines = [];
  const horizontalLines = [];

  if (!type || width <= 0 || height <= 0) {
    return null;
  }
  

  const generateLines = (xStart, xEnd, yStart, yEnd) => {
    for (let i = xStart; i <= xEnd; i += gridSize) {
      verticalLines.push(
        <Line key={`vertical-${i}`} points={[i, yStart, i, yEnd]} stroke={strokeColor} strokeWidth={strokeWidth} />
      );
    }

    for (let i = yStart; i <= yEnd; i += gridSize) {
      horizontalLines.push(
        <Line key={`horizontal-${i}`} points={[xStart, i, xEnd, i]} stroke={strokeColor} strokeWidth={strokeWidth} />
      );
    }
  };

  let x = padding;
  let y = padding;
  let borderWidth = width - 2 * padding;
  let borderHeight = height - 2 * padding;

  switch (type) {
    case "full_mash":
      generateLines(padding, width - padding, padding, height - padding);
      break;

    case "pull-down":
      borderHeight = height / 2 - padding;
      generateLines(padding, width - padding, padding, height / 2);
      break;

    case "pull-right":
      borderWidth = width / 3 - padding;
      generateLines(padding, width / 3, padding, height - padding);
      break;

    case "pull-left":
      x = (width * 2) / 3;
      borderWidth = width / 3 - padding;
      generateLines(x, width - padding, padding, height - padding);
      break;

    case "pull-both": {
      const leftWidth = width / 3 - padding;
      const rightX = (width * 2) / 3;
      
      generateLines(padding, width / 3, padding, height - padding);
      const borderRect1 = (
        <Rect key="border-1" x={padding} y={padding} width={leftWidth} height={borderHeight} stroke={strokeColor} strokeWidth={2} />
      );

      const leftLines = [...verticalLines, ...horizontalLines, borderRect1];
      verticalLines.length = 0;
      horizontalLines.length = 0;
      
      generateLines(rightX, width - padding, padding, height - padding);
      const borderRect2 = (
        <Rect key="border-2" x={rightX} y={padding} width={leftWidth} height={borderHeight} stroke={strokeColor} strokeWidth={2} />
      );

      return <Group>{leftLines}{[...verticalLines, ...horizontalLines, borderRect2]}</Group>;
    }

    default:
      return null;
  }

  const borderRect = (
    <Rect key="border" x={x} y={y} width={borderWidth} height={borderHeight} stroke={strokeColor} strokeWidth={4} />
  );

  return <Group>{[...verticalLines, ...horizontalLines, borderRect]}</Group>;
};

export default DrawMesh;