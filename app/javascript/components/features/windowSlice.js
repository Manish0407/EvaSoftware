import { UpdateDisabledOutlined } from '@mui/icons-material';
import { createSlice } from '@reduxjs/toolkit';
const initialWidth = 1400;
const initialHeight = 1400;
const initialFrameSize = 50;
const DIVIDER_SIZE = 50;
const initialId = Math.round(Math.random() * 1000000)

const initialState = {
  nodeType: "section",
  id: initialId,
  width: initialWidth,
  height: initialHeight,
  frameSize: initialFrameSize,
  type: "none",
  splitDirection: "null",
  mesh: false,
  selectedSectionId: null,
  color: "white",
  addons: ["fan"],
  ischild: false,
  isSelected: false,
  sections: [{
    nodeType: "section",
    id: Math.round(Math.random() * 1000000),
    width: initialWidth - (initialFrameSize * 2),
    height: initialHeight - (initialFrameSize * 2),
    frameSize: 0,
    type: "none", 
    ischild: true,
    splitDirection: "null",
    mesh: false,
    parentId: initialId,
    selectedSectionId: null,
    isSelected: false,
    sections: []
  }]
};
  
const calculateChildDimensions = (parent, child) => {
  const width = parent.width - (parent.frameSize * 2);
  const height = parent.height - (parent.frameSize * 2);

  if (child.nodeType === "section") {
    return {
      width: parent.splitDirection === "vertical" ? (width - DIVIDER_SIZE) / 2 : width,
      height: parent.splitDirection === "horizontal" ? (height - DIVIDER_SIZE) / 2 : height
    };
  } else {
    return {
      width: parent.splitDirection === "vertical" ? DIVIDER_SIZE : width,
      height: parent.splitDirection === "horizontal" ? DIVIDER_SIZE : height
    };
  }
};

const windowSlice = createSlice({
  name: 'window',
  initialState,
  reducers: {
    setColor: (state, action) => {
     state.color = action.payload.color;
    },
    setSelectedSectionId: (state, action) => {
      state.selectedSectionId = action.payload;
    },
    setIsSelected: (state, action) => {
      state.isSelected = action.payload;
    },
    updateWindow: (state, action) => {
      return { ...state, ...action.payload };
    },
    splitSection: (state, action) => {
      const { sectionId, direction } = action.payload;

      console.log(sectionId, direction);
      const section = findSectionById(state, sectionId);

      if (section) {
        const width = section.width - (section.frameSize * 2);
        const height = section.height - (section.frameSize * 2);

        section.sections = [
          {
            nodeType: "section",
            id: Math.round(Math.random() * 1000000),
            width: direction === "vertical" ? (width - DIVIDER_SIZE) / 2 : width,
            height: direction === "horizontal" ? (height - DIVIDER_SIZE) / 2 : height,
            frameSize: 0,
            type: "none",
            splitDirection: "null",
            ischild: true,
            parentId: section.id,
            mesh: false,
            sections: []
          },
          {
            nodeType: "divider",
            id: Math.round(Math.random() * 1000000),
            width: direction === "vertical" ? DIVIDER_SIZE : width,
            ischild: true,
            parentId: section.id,
            height: direction === "horizontal" ? DIVIDER_SIZE : height,
            mash: false,
            sections: []
          },
          {
            nodeType: "section",
            id: Math.round(Math.random() * 1000000),
            width: direction === "vertical" ? (width - DIVIDER_SIZE) / 2 : width,
            height: direction === "horizontal" ? (height - DIVIDER_SIZE) / 2 : height,
            frameSize: 0,
            ischild: true,
            type: "none",
            parentId: section.id,
            mash: false,
            splitDirection: "null",
            sections: []
          }
        ];
        section.splitDirection = direction;
      }
    },
    updatehandleType: (state, action) => {
      const { sectionId, type } = action.payload;
      const section = findSectionById(state, sectionId);

      if (section) {
        section.type = type;
        section.frameSize = type === "none" ? section.frameSize || 50 : initialFrameSize || 50;
      }
    },
    updateFrameSize: (state, action) => {
      const { sectionId, frameSize } = action.payload;
      const section = findSectionById(state, sectionId);

      if (section) {
        const widthRatio = (section.width - frameSize * 2) / (section.width - section.frameSize * 2);
        const heightRatio = (section.height - frameSize * 2) / (section.height - section.frameSize * 2);
        section.frameSize = frameSize;

        const updateChildDimensions = (child) => {
          child.width *= widthRatio;
          child.height *= heightRatio;
          if (child.sections) {
            child.sections.forEach(updateChildDimensions);
          }
        };

        section.sections.forEach(updateChildDimensions);
      }
    },
    updateSectionDimensions: (state, action) => {
      const { sectionId, width, height } = action.payload;
      const section = findSectionById(state, sectionId);

      if (!section) return;

      const updateChildDimensions = (section, width, height) => {
        section.width = width;
        section.height = height;
        if (section.sections && section.sections.length > 0) {
          section.sections.forEach((child) => {
            const dimensions = calculateChildDimensions(section, child);
            updateChildDimensions(child, dimensions.width, dimensions.height);
          });
        }
      }

      const updateParentDimensions = (section, width, height) => {
        if (!section.parentId) return;
        const parent = findSectionById(state, section.parentId);

        if (parent) {
          const widthDiffrence = width - section.width;
          const heightDiffrence = height - section.height; 
          const isNagative = widthDiffrence < 0 || heightDiffrence < 0; 
          if(isNagative){}
          else{}
        }
      }

      if (!section.ischild) {
        updateChildDimensions(section, width, height);
      } else {
        updateParentDimensions(section, width, height);
      }
    },
    toggleAddon: (state, action) => {
      const { sectionId, add_on_type } = action
      const section = findSectionById(state, sectionId);
    },
    toggleMesh: (state, action) => {
      const { sectionId, mash_type } = action.payload;
      const section = findSectionById(state, sectionId);

      if (section) {
        section.mash_type = mash_type
        section.mesh = true;
      }
    }
  }
});


const findSectionById = (section, id) => {
  if (section.id === id) return section;
  if (section.sections) {
    for (const child of section.sections) {
      const found = findSectionById(child, id);
      if (found) return found;
    }
  }
  return null;
};


export const selectSelectedSection = (state) => {
  const { selectedSectionId } = state.window;
  return selectedSectionId ? findSectionById(state.window, selectedSectionId) : null;
};

export const {
  setSelectedSectionId,
  setIsSelected,
  updateWindow,
  updatehandleType,
  splitSection,
  updateFrameSize,
  updateSectionDimensions,
  toggleMesh,
  toggleAddon,
  setColor
} = windowSlice.actions;

export default windowSlice.reducer;