import React, { useState, useCallback } from "react";
import { Menu, MenuItem, IconButton, Box } from "@mui/material";
import { useDispatch, useSelector } from "react-redux";
import { splitSection, setSelectedSectionId, setIsSelected, updatehandleType, setColor, toggleMesh, toggleAddon } from "../features/windowSlice";
import { MuiColorInput } from 'mui-color-input';
import {
  ViewModule as LayoutIcon, Image as ImagesIcon, CropSquare as FrameIcon, Palette as PaintIcon,
  SplitscreenRounded as SplitscreenIcon, VerticalSplit as VerticalSplitIcon, HorizontalSplitTwoTone as HorizontalSplitIcon,
  ShapeLine as ShapeLineIcon, CheckBoxOutlineBlank as EmptyIcon, ArrowBack as ArrowBackIcon,
  KeyboardArrowRight as RightArrowIcon, UTurnLeft as UTurnLeftIcon, UTurnRight as UTurnRightIcon,
  GridGoldenratioOutlined, GridOnOutlined, LineStyleRounded, PanToolAltOutlined,
  AddBoxOutlined, CameraAltOutlined, CollectionsRounded, ColorLensOutlined, ViewWeekOutlined,
  KeyboardArrowRightOutlined
} from "@mui/icons-material";

import { RiUploadCloudFill } from "react-icons/ri";
import { FaCircleNotch } from "react-icons/fa";

const menuOptions = {
  mullion: [
    { title: "Vertical Split", icon: <VerticalSplitIcon />, action: "vertical" },
    { title: "Three Way Split", icon: <SplitscreenIcon />, action: "three-way" },
    { title: "Four Way Split", icon: <ViewWeekOutlined />, action: "four-way" },
  ],
  sash: [
    { title: "Empty", icon: <EmptyIcon />, action: "none" },
    { title: "Open Left", icon: <ArrowBackIcon />, action: "left" },
    { title: "Open Right", icon: <RightArrowIcon />, action: "right" },
    { title: "Tilt Left", icon: <UTurnLeftIcon />, action: "tilt-left" },
    { title: "Tilt Right", icon: <UTurnRightIcon />, action: "tilt-right" },
  ],
  desing: [
    {
      title: "Mash and Add-on",
      icon: <GridGoldenratioOutlined />,
      subMenu: [
        { title: "Mash", icon: <GridOnOutlined />, action: "full_mash" },
        { title: "Pull Down", icon: <GridOnOutlined />, action: "pull-down" },
        { title: "Pull Right", icon: <GridOnOutlined />, action: "pull-right" },
        { title: "Pull left", icon: <GridOnOutlined />, action: "pull-left" },
        { title: "Pull both", icon: <GridOnOutlined />, action: "pull-both" },
      ],
    },
    {
      title: "Add-ons",
      icon: <AddBoxOutlined />,
      subMenu: [
        { title: "Fac", icon: <FaCircleNotch />, action: "FanAddOn" },
      ],
    },
  ],
  coupler: [
    { title: "Vertical Join", icon: <VerticalSplitIcon />, action: "vertical" },
    { title: "Horizontal Join", icon: <HorizontalSplitIcon />, action: "horizontal" },
  ],
  images: [
    { title: "Gallery", icon: <CollectionsRounded /> },
    { title: "Upload", icon: <RiUploadCloudFill /> },
    { title: "Camera", icon: <CameraAltOutlined /> },
  ],
  color: [{ title: "Color Picker", icon: <ColorLensOutlined />, type: 'color-picker' }],
};

const sidebarItems = [
  { title: "Mullion", icon: <LayoutIcon />, type: "mullion" },
  { title: "Sash", icon: <ShapeLineIcon />, type: "sash" },
  { title: "Desing", icon: <FrameIcon />, type: "desing" },
  { title: "Coupler", icon: <SplitscreenIcon />, type: "coupler" },
  { title: "Images", icon: <ImagesIcon />, type: "images" },
  { title: "Color", icon: <PaintIcon />, type: "color" },
];

export const Sidebar = () => {
  const dispatch = useDispatch();
  const [anchorEl, setAnchorEl] = useState(null);
  const [menuItems, setMenuItems] = useState([]);
  const [subMenuAnchorEl, setSubMenuAnchorEl] = useState(null);
  const [subMenuItems, setSubMenuItems] = useState([]);
  const [selectedColor, setSelectedColor] = useState("#000000");
  const selectedSectionId = useSelector((state) => state.window.selectedSectionId);

  const handleMenuAction = useCallback((action) => {
    if (!action) return;
    if (["vertical", "three-way", "four-way", "horizontal"].includes(action)) {
      dispatch(splitSection({ sectionId: selectedSectionId, direction: action }));
    } else if (["none", "left", "right", "tilt-left", "tilt-right"].includes(action)) {
      dispatch(updatehandleType({ sectionId: selectedSectionId, type: action }));
    } else if(["full_mash", "pull-down", "pull-right", "pull-left", "pull-both"].includes(action)) {
      dispatch(toggleMesh({sectionId: selectedSectionId, mash_type: action}));
    } else if(["FanAddOn"]){
      dispatch(toggleAddon({sectionId: selectedSectionId, add_on_type: action}));
    }
    dispatch(setSelectedSectionId(null));
    dispatch(setIsSelected(false));
  }, [dispatch, selectedSectionId]);

  const handleClick = useCallback((event, type) => {
    event.stopPropagation();
    setAnchorEl(event.currentTarget);
    const selectedMenuOptions = menuOptions[type] || [];
    setMenuItems(selectedMenuOptions);
  }, []);

  const handleSubMenuClick = useCallback((event, items) => {
    event.stopPropagation();
    setSubMenuAnchorEl(event.currentTarget);
    setSubMenuItems(items);
  }, []);

  const handleClose = useCallback(() => {
    setAnchorEl(null);
    setMenuItems([]);
    setSubMenuAnchorEl(null);
    setSubMenuItems([]);
  }, []);

  return (
    <Box component="aside" sx={{ display: "flex", flexDirection: "column", gap: 1, p: 2 }}>
      {sidebarItems.map(({ title, icon, type }) => (
        <IconButton key={title} title={title} onClick={(e) => handleClick(e, type)}>
          {icon}
        </IconButton>
      ))}
      {anchorEl && (
        <Menu
          anchorEl={anchorEl}
          open={Boolean(anchorEl)}
          onClose={handleClose}
          disableRestoreFocus
        >
          {menuItems.map((item, index) => {
            if (item.type === 'color-picker') {
              return (
                <MenuItem key={index}>
                  {item.icon}
                  <Box sx={{ ml: 1 }}>{item.title}</Box>
                  <MuiColorInput
                    value={selectedColor}
                    onChange={(color) => {
                      setSelectedColor(color);
                      dispatch(setColor({ color: color }));
                    }}
                  />
                </MenuItem>
              );
            } else if (item.subMenu) {
              return (
                <MenuItem
                  key={index}
                  onClick={(e) => handleSubMenuClick(e, item.subMenu)}
                >
                  {item.icon}
                  <Box sx={{ ml: 1 }}>{item.title}</Box>
                  <KeyboardArrowRightOutlined />
                </MenuItem>
              );
            } else {
              return (
                <MenuItem
                  key={index}
                  onClick={() => {
                    handleMenuAction(item.action);
                    handleClose();
                  }}
                >
                  {item.icon}
                  <Box sx={{ ml: 1 }}>{item.title}</Box>
                </MenuItem>
              );
            }
          })}
        </Menu>
      )}
      {subMenuAnchorEl && (
        <Menu
          anchorEl={subMenuAnchorEl}
          open={Boolean(subMenuAnchorEl)}
          onClose={handleClose}
          anchorOrigin={{ vertical: "top", horizontal: "right" }}
          transformOrigin={{ vertical: "top", horizontal: "left" }}
        >
          {subMenuItems.map((item, index) => (
            <MenuItem
              key={index}
              onClick={() => {
                handleMenuAction(item.action);
                handleClose();
              }}
            >
              {item.icon}
              <Box sx={{ ml: 1 }}>{item.title}</Box>
            </MenuItem>
          ))}
        </Menu>
      )}
    </Box>
  );
};