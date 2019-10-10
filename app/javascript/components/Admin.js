import React from "react"
import axios from 'axios'
import { Badge, Table, Form, Button, Row, Col } from 'react-bootstrap'

class Admin extends React.Component {

  constructor(props) {
    super(props)
    this.state = {
      rates: [],
      validated: false
    }
    this.handleSubmit = this.handleSubmit.bind(this)
  }

  componentDidMount() {
    axios
      .get('/admin/api/v1/rates')
      .then(response => {
        this.setState({ rates: response.data })
      })
  }

  _renderHistory(rate) {
    return (
      <Table striped bordered hover>
        <thead>
          <tr>
            <th>Sum</th>
            <th>Date</th>
            <th>Created_at</th>
          </tr>
        </thead>
        <tbody>
          {rate.histories.map(hist => (
            <tr key={hist.id}>
              <td>{hist.sum}</td>
              <td>{hist.force_date}</td>
              <td>{hist.created_at}</td>
            </tr>
          ))}
        </tbody>
      </Table>
    )
  }

  handleSubmit(e) {
    e.preventDefault()
    const form = e.target
    if (form.checkValidity() === false) {
      this.setState({ validated: true })
      return false
    }
    const data = new FormData(form)
    const id = data.get('id')
    form.reset()
    axios
      .put(`/admin/api/v1/rates/${id}`, data)
      .then(response => {
        this.setState({ rates: response.data })
      })
      .catch(errors => {
        console.log(errors)
      })
  }

  _renderForm(id) {
    return (
      <Form
        noValidate
        validated={this.state.validated}
        onSubmit={this.handleSubmit}>
        <Form.Group controlId="forceSum">
          <Form.Label>Force Sum</Form.Label>
          <Form.Control
            required
            min='0.01'
            type="number"
            name="force_sum"
            placeholder="Enter force sum"
            step="0.01"
          />
          <Form.Control.Feedback type="invalid">
            Please provide a valid force sum.
          </Form.Control.Feedback>
        </Form.Group>

        <Form.Group controlId="forceDate">
          <Form.Label>Force Date</Form.Label>
          <Form.Control
            required
            type="datetime-local"
            name="force_date"
            placeholder="Enter force date"
          />
          <Form.Control.Feedback type="invalid">
            Please provide a valid force date.
          </Form.Control.Feedback>
          <Form.Control type="hidden" defaultValue={id} name="id" />
        </Form.Group>
        <Button variant="primary" type="submit">
          Submit
        </Button>
      </Form>
    )
  }
  render() {
    return (
      <React.Fragment>
        {this.state.rates.map(rate => (
          <Row key={rate.id}>
            <Col>
              <br /><hr />
              <h3>
                {rate.title}: <Badge variant="secondary">{rate.current}</Badge>
              </h3>
              {this._renderHistory(rate)}
              {this._renderForm(rate.id)}
            </Col>
          </Row >
        ))
        }
      </React.Fragment>
    );
  }
}

export default Admin
