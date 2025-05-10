import React from "react";
import { Rect } from "react-konva";
import { useSelector } from "react-redux";

const Devider = ({ x, y, width, height }) => {

  const color = useSelector(state => state.window.color);

  return (
    <Rect
      x={x}
      y={y}
      width={width}
      height={height}
      fill={color}
      stroke="black"
      strokeWidth={2}
    />
  );
};

export default Devider;
