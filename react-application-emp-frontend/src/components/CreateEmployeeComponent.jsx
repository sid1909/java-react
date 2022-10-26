import React, { Component } from 'react';
import EmployeeService from '../services/EmployeeService';

class CreateEmployeeComponent extends Component {
   
    constructor(props){
        super(props)
       
        this.state = {
            //step2
         id: this.props.match.params.id,
           firstName: '',
           lastName:'',
           emailId:'' 
        }
        this.changeFirstNameHandler = this.changeFirstNameHandler.bind(this);
        this.changelastNameHandler = this.changelastNameHandler.bind(this);
        //this.changeEmailIdHandler = this.changeEmailIdHandler.bind(this);
        this.saveEmployee = this.saveEmployee.bind(this);
    
    }


//step3
    componentDidMount()
    {
        //step4 
        if(this.state.id == -1){
            return
        } else{

        EmployeeService.getEmployeeById(this.state.id).then( (res) => {
            let employee = res.data;
            this.setState({firstName : employee.firstName,
                lastName : employee.lastName,
                emailId  : employee.emailId
            
            });
        });
    }

    }







    saveEmployee = (e) => {
        e.preventDefault();
        let employee = {firstName : this.state.firstName,lastName:this.state.lastName,emailId:this.state.emailId};
        console.log('employee => ' +JSON.stringify(employee));

       //step5 
       if(this.state.id == -1){
        EmployeeService.createEmployee(employee).then(res => {
            this.props.history.push('/employees');
          });
    } else{
        EmployeeService.updateEmployee(employee, this.state.id).then(res => {

            this.props.history.push('/employees');
      });



        
    }
}
cancel(){
    this.props.history.push('/employees');
}

   changeFirstNameHandler = (event) => {
       this.setState({firstName: event.target.value});
   }

   changelastNameHandler = (event) => {
    this.setState({lastName:event.target.value});
}
changeEmailIdHandler = (event) => {
    this.setState({emailId:event.target.value});
}

getTitle(){
    if(this.state.id == -1 )
    {
        return  <h3 className="text-center">Add Employee</h3>
    }else
    {
        return <h3 className="text-center">Update Employee</h3>
    }
}
   
   
    render() {
        return (
            <div>
               <div className = "container">
                   <div className="row">
                       <div className = "card col-md-6 offset-md-3 offset-md-3">
                           {
                               this.getTitle()
                           }
                           <div className = "card-body">
                            <form>
                              <div className="form-group">
                                <label>first Name : </label>
                                <input placeholder="First Name" name="firstName" className="form-control" 
                                                value={this.state.firstName}
                                                onChange={this.changeFirstNameHandler}/>


                              </div>

                              <div className="form-group">
                                <label>last Name : </label>
                                <input placeholder="last Name" name="lastName" className="form-control" 
                                                value={this.state.lastName}
                                                onChange={this.changelastNameHandler}/>


                              </div>

                              <div className="form-group">
                                <label>email Id : </label>
                                <input placeholder="email Id" name="emailId" className="form-control" 
                                                value={this.state.emailId}
                                                onChange={this.changeEmailIdHandler}/>


                              </div>
                              <button className="btn btn-success" onClick={this.saveEmployee}>save</button>
                              <button className="btn btn-danger" onClick={this.cancel.bind(this)} style={{marginLeft: "10px"}}>cancel</button>

                            </form>

                           </div>

                       </div>
                         
                   </div>
               </div>
                
            </div>
        );
    }
}

export default CreateEmployeeComponent;