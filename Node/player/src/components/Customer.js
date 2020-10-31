import React from 'react';
import TableRow from '@material-ui/core/TableRow';
import TableCell from '@material-ui/core/TableCell';
import CustomerDelete from './CustomerDelete'

class Customer extends React.Component {
    render() {
        return (
            <TableRow>
                <TableCell><img src={this.props.image} alt="profile"/></TableCell>
                <TableCell>{this.props.text}</TableCell>
            </TableRow>
        )
    }
}

export default Customer;