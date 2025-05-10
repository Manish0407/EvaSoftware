import React from 'react'
import { Circle, Group, Path, Rect } from 'react-konva';

const Addons = (width, height, padding, type, x=0, y=0) => {
  const bladePath = "M10 0 L30 20 Q50 50 20 30 Z"; 

  return (
    <Group x={x} y={y}>
       <Rect x={25} y={25} width={150} height={150} stroke="gray" strokeWidth={4} cornerRadius={10} />
       {[
          { x: 35, y: 35 },
          { x: 165, y: 35 },
          { x: 35, y: 165 },
          { x: 165, y: 165 }
        ].map((point, i) => (
          <Circle key={i} x={point.x} y={point.y} radius={5} fill="gray" />
        ))}
        <Group x={100} y={100}>
          {[...Array(5)].map((_, i) => (
            <Path key={i} data={bladePath} fill="gray" rotation={i * 72} />
          ))}
          <Circle x={0} y={0} radius={15} fill="gray" stroke="black" strokeWidth={2} />
        </Group>
    </Group>
  )
}

export default Addons