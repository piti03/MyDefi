import { useState } from 'react'
import React,{Component} from 'react'
import Navbar from './components/Navbar'

class App extends Component{
  constructor(props){
    super(props)
    this.state = {
      account: '0x0445555555'
    }
  }
  render(){

  
    return(
      <>
      <Navbar account = {this.state.account}/>
      <div className='container-fluid bg-primary text-center text-white p-5'>
        <h1>Hello World</h1>
      </div>
     
      </>
    );

  }

}



export default App
