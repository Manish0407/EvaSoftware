import React, { useEffect, useRef, useState } from 'react'
import { Group, Rect } from "react-konva";
import Glass from './Glass';
import Sash from './Sash'
import Handle from './Handle'
import Devider from './Devider';
import DrawMesh from './DrawMesh';
import Addons from './Addons';
import OpeningDirection from './OpeningDirection';
import { useDispatch, useSelector } from 'react-redux';
import { setIsSelected, setSelectedSectionId, } from '../../features/windowSlice';

export const Section = ({
  section,
  x = 0,
  y = 0,
}) => {
  const groupRef = useRef(null);
  const width = section.width
  const dispatch = useDispatch();
  const height = section.height
  const selectedSectionId = useSelector(state => state.window.selectedSectionId)
  const window = useSelector(state => state.window)
  const isSelected = useSelector(state => state.window.isSelected)

  const handleClick = (e) => {
    const firstSection = e.target.findAncestor(".section");
    if (firstSection === groupRef.current) {
      if (section.id === window.id) {
        return
      }
      dispatch(setIsSelected(true));
      dispatch(setSelectedSectionId(section.id))
    }
  };

  const childSections = [];
  let offsetX = 0;
  let offsetY = 0;

  for (const child of section.sections) {
    if (child.nodeType === "section") {
      childSections.push(
        <Section
          key={child.id}
          section={child}
          x={offsetX + section.frameSize}
          y={offsetY + section.frameSize}
        />
      );
    } else {
      childSections.push(
        <Devider
          key={child.id}
          width={child.width}
          height={child.height}
          color={section.color}
          x={offsetX + section.frameSize}
          y={offsetY + section.frameSize}
        />
      );
    }

    if (section.splitDirection === "vertical") {
      offsetX += child.width;
    } else {
      offsetY += child.height;
    }
  }

  return (
    <Group
      x={x}
      y={y}
      onClick={handleClick}
      ref={groupRef}
      name="section"
    >
      {
        section.sections.length <= 0 &&
        <>
          <Glass width={width} height={height} padding={section.frameSize}></Glass>
          {<DrawMesh width={section.width} height={section.height} padding={section.frameSize} type={section.mash_type} />}
          {isSelected && selectedSectionId === section.id && (
            <Rect x={section.frameSize} y={section.frameSize} width={width - section.frameSize * 2} height={height - section.frameSize * 2} fill="green" opacity={0.3}
            />)}
          <Addons />
        </>
      }
      <OpeningDirection width={section.width} height={section.height} padding={section.frameSize} type={section.type} />
      <Sash width={width} height={height} size={section.frameSize} id={section.id} />
      <Handle width={width} height={height} padding={section.frameSize} type={section.type} />
      {childSections}
    </Group>
  )
}
