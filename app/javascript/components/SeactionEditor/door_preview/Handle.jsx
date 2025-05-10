import React from 'react';
import { Group, Shape } from 'react-konva';

const Handle = ({ width, height, type, padding }) => {
  if (type === 'none') {
    return null;
  }

  let x, y;

  if (type.indexOf('left') >= 0) {
    x = padding / 2;
    y = height / 2;
  } else if (type.indexOf('right') >= 0) {
    x = width - padding / 2;
    y = height / 2;
  } else {
    console.error('Invalid handle type');
    return null;
  }

  // Define handle dimensions based on padding
  const handleWidth = padding * 0.8; // Adjust as needed
  const handleHeight = padding * 1.5; // Adjust as needed

  return (
    <Shape
      x={x}
      y={y}
      fill="rgba(0, 0, 0, 0.2)"
      sceneFunc={(ctx, shape) => {
        ctx.beginPath();
        ctx.rect(-handleWidth / 2, -handleHeight / 2, handleWidth, handleHeight);
        // Draw 
        ctx.rect(-handleWidth / 3, handleHeight / 2, (2 * handleWidth) / 3, handleHeight / 2);
        ctx.fillStrokeShape(shape);
      }}
      stroke="black"
      strokeWidth={1}
    />
  );
};

export default Handle;