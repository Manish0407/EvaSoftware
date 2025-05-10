import React, { useState } from 'react';
import { Group, Line, Arrow, Label, Text, Tag } from 'react-konva';
import { Html } from 'react-konva-utils';
import { useDispatch, useSelector } from 'react-redux';
import { updateSectionDimensions } from '../../features/windowSlice';
let METRIC_SIZE = 100;
let PADDING = 0;


function VerticalMetric({ x, y, width, height, updateDimensions }) {
  const [editble, setEditble] = useState(false);
  const [newHeight, setnewHeight] = useState(height)
  const handleTextClick = (e) => {
    setEditble(true);
  };

  return (
    <Group x={x} y={y}>
      <Arrow
        points={[METRIC_SIZE / 2, 0, METRIC_SIZE / 2, height]}
        stroke="black"
        fill="black"
        pointerAtBeginning
      />
      <Line points={[0, 0, METRIC_SIZE, 0]} stroke="black" />
      <Line points={[0, height, METRIC_SIZE, height]} stroke="black" />
      <Label x={METRIC_SIZE / 2 + 50} y={height / 2}  rotation={90} width={100} height={100}>
        <Tag fill="white" stroke="black" />
        {!editble ? (
          <Text fontSize={50} text={height + ' mm'} padding={10} onDblClick={handleTextClick} />
        ) : (
          <Html>
            <input
              style={{
              fontSize: '50px',
                width: '230px',
                height: '70px',
                padding: '10px',
                textAlign: 'center',
                border: "2px solid black"
              }}
              value={newHeight}
              type="number"
              onChange={(e) => { setnewHeight(e.target.value) }}
              onKeyUp={(e) => {
                if (e.key === 'Enter') {
                  setEditble(false);
                  updateDimensions(width, newHeight);
                }
              }
              }
            />
          </Html>
        )}
      </Label>
    </Group>
  );
}

function HorizontalMetric({ x, y, width, height, sec, updateDimensions }) {
  const [editble, setEditble] = useState(false);
  const [newWidth, setnewWidth] = useState(width)
  const handleTextClick = (e) => {
    setEditble(true);
  };

  return (
    <Group x={x} y={y}>
      <Arrow
        points={[0, METRIC_SIZE / 2, width, METRIC_SIZE / 2]}
        stroke="black"
        fill="black"
        pointerAtBeginning
      />
      <Line points={[0, 0, 0, METRIC_SIZE]} stroke="black" />
      <Line points={[width, 0, width, METRIC_SIZE]} stroke="black" />
      <Label x={width / 2} y={METRIC_SIZE / 2}>
        <Tag fill="white" stroke="black" />
        {!editble ? (
          <Text text={width + ' mm'} fontSize={50} padding={10} onDblClick={handleTextClick} />
        ) : (
          <Html>
            <input
              style={{
                fontSize: '50px',
                width: '230px',
                height: '70px',
                padding: '10px',
                textAlign: 'center',
                border: "2px solid black"
              }}
              value={newWidth}
              type="number"
              onChange={(e) => setnewWidth(e.target.value)}
              onKeyUp={(e) => {
                if (e.key === 'Enter') {
                  setEditble(false);
                  updateDimensions(newWidth, height);
                }
              }}
            />
          </Html>
        )}
      </Label>
    </Group>
  );
}

const Metrics = ({ root }) => {
  const dispatch = useDispatch();
  const { width, height } = root;
  const verticalComponents = [];
  const horizontalComponents = [];

  function processSection(sec, verticalPos, horizontalPos, level = 0) {
    const verticalKey = `vertical-${sec.id}`;
    const horizontalKey = `horizontal-${sec.id}`;

    function updateDimensions(width, height) {
      dispatch(updateSectionDimensions({ 
        sectionId: sec.id, 
        width: width, 
        height: height 
      }));
    }

    const levelOffset = level * PADDING;

    verticalComponents.push(
      <VerticalMetric
        key={verticalKey}
        width={sec.width}
        height={sec.height}
        x={verticalPos.x + levelOffset}
        y={verticalPos.y}
        updateDimensions={updateDimensions}
      />
    );
    horizontalComponents.push(
      <HorizontalMetric
        key={horizontalKey}
        x={horizontalPos.x}
        y={horizontalPos.y + levelOffset}
        width={sec.width}
        height={sec.height}
        updateDimensions={updateDimensions}
      />
    );

    const isVertical = sec.splitDirection === 'vertical';
    const isHorizontal = sec.splitDirection === 'horizontal';
    const hasSections = sec.sections.length > 0;

    let childOffset = 0;
    if (isHorizontal) {
      for (const child of sec.sections) {
        processSection(
          child,
          {
            x: verticalPos.x + METRIC_SIZE + sec.frameSize,
            y: verticalPos.y + childOffset + sec.frameSize,
          },
          {
            x: horizontalPos.x + sec.frameSize,
            y: horizontalPos.y + sec.frameSize,
          },
          level + 1
        );
        childOffset += child.height
      }
    }
    if (isVertical) {
      for (const child of sec.sections) {
        processSection(
          child,
          {
            x: verticalPos.x + sec.frameSize,
            y: verticalPos.y + sec.frameSize
          },
          {
            x: horizontalPos.x + childOffset + sec.frameSize,
            y: horizontalPos.y + METRIC_SIZE + sec.frameSize,
          },
          level + 1
        );
        childOffset += child.width
      }
    }
    if (!isVertical && !isHorizontal && hasSections) {
      processSection(
        sec.sections[0],
        {
          x: verticalPos.x + METRIC_SIZE,
          y: verticalPos.y + sec.frameSize
        },
        {
          x: horizontalPos.x + sec.frameSize,
          y: horizontalPos.y + METRIC_SIZE
        }
      );
    }
  }

  processSection(root, { x: 0, y: 0 }, { x: 0, y: 0 });

  return (
    <Group>
      <Group x={width}>{verticalComponents}</Group>
      <Group y={height}>{horizontalComponents}</Group>
    </Group>
  );
};

export default Metrics