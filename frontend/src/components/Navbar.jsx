import React, { Component } from "react";
import bank from "../assets/bank.png"

class Navbar extends Component{
   
    
    render(){
    
        return(
            <nav className="navbar bg-dark " data-bs-theme="dark"style={{height:"50px"}}>
                <a className="navbar-brand col-sm-3 col-md-2 mr-0" >
                <img src={bank} width={30} height={30} className="d-inline-block align-top" alt="bank image"/>  DApp Defi Staking </a>
                <ul className="navbar-nav px-3">
                    <li className=" nav-item ">
                        <small style={{color:"white" ,marginRight:"15px"}}>Account: {this.props.account}</small>
                    </li>
                </ul>
           
            </nav>
        );
    }
}


export default Navbar;
