import React from "react"
import Home from "./Home.jsx";
import Sign from "./Sign.jsx";
import Client from "./Client.jsx";
import Employer from "./Employer.jsx";
import Login from "./Login.jsx";
import {BrowserRouter,Routes,Route} from "react-router-dom"
const  App=()=>{
 
  return (
    <BrowserRouter>
    <Routes>
      <Route path='/' element={<Home/>}> </Route>
      <Route path='/Sign' element={<Sign/>}> </Route>
      <Route path='/Client' element={<Client/>}> </Route>
      <Route path='/Employer' element={<Employer/>}> </Route>
      <Route path='/Login' element={<Login/>}> </Route>
    </Routes>
    </BrowserRouter>
  )
}
export default App