import React from "react"
import Header from "./Header"
import { Sidebar } from "./Sidebar"
import { RootFream } from "./door_preview/RootFream"

export default function DoorConfigurator({ Component, pageProps }) {
 
  return (
      <div className="configurator">
        <Header/>
        <div className="configurator__body">
          <Sidebar/>
          <main className="configurator__main">
            <div className="configurator__canvas">
              <RootFream/>
            </div>  
          </main>
        </div>
      </div>
  )
}

