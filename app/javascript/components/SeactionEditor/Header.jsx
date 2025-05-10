import React, { useState } from 'react'
import { Box, Paper, TextField, Button, Select, MenuItem, InputLabel, FormControl, Slide, IconButton, Typography } from "@mui/material"
import SaveIcon from '@mui/icons-material/Save';
import EditIcon from '@mui/icons-material/Edit';
import NotificationsIcon from '@mui/icons-material/Notifications';
import CloseIcon from '@mui/icons-material/Close';

const Header = () => {
  const [formOpen, setFormOpen] = useState(false);
  const [formData, setFormData] = useState({
    designRef: 'rest2',
    quantity: 1,
    location: '',
    floorNumber: '',
    note: '',
    glassType: ''
  });

  const handleInputChange = (e) => {
    const { name, value } = e.target;
    setFormData(prev => ({
      ...prev,
      [name]: value
    }));
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    setFormOpen(false);
  };

  return (
    <>
      <Box component="header" className="configurator__header" display="flex" justifyContent="space-between" alignItems="center">
        <Box className="configurator__title-group" display="flex" alignItems="center">
          <Box className="configurator__logo"></Box>
          <Box className="configurator__title" display="flex" flexDirection="column">
            <Typography variant="h6">Design ref. : {formData.designRef}</Typography>
            <Box className="configurator__quantity" display="flex" alignItems="center">
              <Typography>Qty: {formData.quantity}</Typography>
              <IconButton onClick={() => setFormOpen(true)}>
                <EditIcon />
              </IconButton>
            </Box>
          </Box>
        </Box>
        <Box className="configurator__actions" display="flex" alignItems="center">
          <IconButton>
            <NotificationsIcon />
          </IconButton>
          <Button variant="contained" color="primary" startIcon={<SaveIcon />}>
            Save
          </Button>
          <IconButton>
            <CloseIcon />
          </IconButton>
        </Box>
      </Box>
      <Slide direction="down" in={formOpen} mountOnEnter unmountOnExit>
        <Paper 
          className="configurator__edit-form" 
          style={{ 
              padding: '16px', marginTop: '16px', margin: '16px auto',
              position: "absolute",
              maxWidth: "30%",
              left: "1%",
              top: "10%",
              zIndex: 9,
           }}>
          <form onSubmit={handleSubmit}>
            <Box display="flex" flexWrap="wrap" gap="16px">
              <TextField
                label="Design Reference"
                name="designRef"
                value={formData.designRef}
                onChange={handleInputChange}
                style={{ flex: '1 1 45%' }}
              />
              <TextField
                label="Quantity"
                type="number"
                name="quantity"
                value={formData.quantity}
                onChange={handleInputChange}
                style={{ flex: '1 1 45%' }}
              />
              <TextField
                label="Location"
                name="location"
                value={formData.location}
                onChange={handleInputChange}
                style={{ flex: '1 1 45%' }}
              />
              <TextField
                label="Floor Number"
                type="number"
                name="floorNumber"
                value={formData.floorNumber}
                onChange={handleInputChange}
                style={{ flex: '1 1 45%' }}
              />
              <TextField
                label="Note"
                name="note"
                value={formData.note}
                onChange={handleInputChange}
                multiline
                rows={4}
                style={{ flex: '1 1 100%' }}
              />
              <FormControl style={{ flex: '1 1 45%' }}>
                <InputLabel>Glass Type</InputLabel>
                <Select
                  name="glassType"
                  value={formData.glassType}
                  onChange={handleInputChange}
                >
                  <MenuItem value=""><em>Select Glass Type</em></MenuItem>
                  <MenuItem value="Tempered">Tempered</MenuItem>
                  <MenuItem value="Laminated">Laminated</MenuItem>
                  <MenuItem value="Annealed">Annealed</MenuItem>
                </Select>
              </FormControl>
              <Box display="flex" justifyContent="space-between" width="100%" marginTop="8px">
                <Button type="submit" variant="contained" color="primary">Submit</Button>
                <Button type="button" variant="outlined" onClick={() => setFormOpen(false)}>Cancel</Button>
              </Box>
            </Box>
          </form>
        </Paper>
      </Slide>
    </>
  )
}

export default Header