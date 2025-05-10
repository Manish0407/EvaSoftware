import React from "react";
import { Group, Rect } from "react-konva";

function Glass({ padding, width, height }) {
  return (
    <Group>
      <Rect
        x={padding}
        y={padding}
        width={width - padding * 2}
        height={height - padding * 2}
        opacity={0.6}
        fill="lightblue"
      />
    </Group>
  );
}
export default Glass;