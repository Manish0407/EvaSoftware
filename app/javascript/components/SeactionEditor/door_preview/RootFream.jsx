import React, { useState, useRef, useEffect } from "react";
import { Stage, Layer, Group } from "react-konva";
import { setSelectedSectionId, setIsSelected } from "../../features/windowSlice";
import { useDispatch, useSelector } from "react-redux";
import Grid from "./Grid";
import { Section } from "./Section";
import Metrics from "./Metrics";
import Sash from "./Sash";

export const RootFream = () => {
  const containerRef = useRef(null);
  const stageRef = useRef(null);
  const dispatch = useDispatch();
  const windows = useSelector((state) => state.window);
  const selectedSectionId = useSelector((state) => state.window.selectedSectionId);
  const isSelected = useSelector(state => state.window.isSelected);

  const [stage, setStage] = useState({
    scale: 1,
    x: 0,
    y: 0,
  });

  const [dimensions, setDimensions] = useState({
    width: 0,
    height: 0,
  });

  useEffect(() => {
    const updateDimensions = () => {
      if (containerRef.current) {
        setDimensions({
          width: containerRef.current.clientWidth,
          height: containerRef.current.clientHeight,
        });
      }
    };

    updateDimensions();
    const resizeObserver = new ResizeObserver(updateDimensions);
    resizeObserver.observe(containerRef.current);

    return () => resizeObserver.disconnect();
  }, []);

  useEffect(() => {
    if (dimensions.width > 0 && dimensions.height > 0 && windows.width > 0 && windows.height > 0) {
      const scaleX = dimensions.width / windows.width;
      const scaleY = dimensions.height / windows.height;
      const scale = Math.min(scaleX, scaleY);

      const offsetX = (dimensions.width - windows.width * scale) / 2;
      const offsetY = (dimensions.height - windows.height * scale) / 2;

      setStage({
        scale: 0.70,
        x: offsetX,
        y: offsetY,
      });
    }
  }, [dimensions, windows.width, windows.height]);

  const handleWheel = (e) => {
    e.evt.preventDefault();
    const scaleBy = 1.04;
    const stage = e.target.getStage();
    const oldScale = stage.scaleX();
    const newScale = e.evt.deltaY < 0 ? oldScale * scaleBy : oldScale / scaleBy;

    if (newScale < 0 || newScale > 10) return;

    const mousePointTo = {
      x: stage.getPointerPosition().x / oldScale - stage.x() / oldScale,
      y: stage.getPointerPosition().y / oldScale - stage.y() / oldScale,
    };

    setStage({
      scale: newScale,
      x: (stage.getPointerPosition().x / newScale - mousePointTo.x) * newScale,
      y: (stage.getPointerPosition().y / newScale - mousePointTo.y) * newScale,
    });
  };

  return (
    <div
      className="canvas_container"
      ref={containerRef}
      style={{
        width: "100%",
        height: "100%",
        overflow: "hidden",
        zIndex: 7,
      }}
    >
      <Stage
        width={dimensions.width}
        height={dimensions.height}
        scaleX={stage.scale}
        scaleY={stage.scale}
        draggable
        onDragMove={() => {}}
        onDragEnd={() => {}}
        x={stage.x}
        y={stage.y}
        onWheel={handleWheel}
      >
        <Layer>
          <Group>
            <Grid  
              windows={windows} 
              gridSize={40} 
              stageWidth={dimensions.width}
              stageHeight={dimensions.height}
            >
               <Section
                  isSelected={isSelected}
                  setIsSelected={(value) => dispatch(setIsSelected(value))}
                  section={windows}
                  setSelectedSectionId={(id) => dispatch(setSelectedSectionId(id))}
                  selectedSectionId={selectedSectionId}
                />
                <Metrics root={windows} />
            </Grid>
          </Group>
        </Layer>
      </Stage>
    </div>
  );
};