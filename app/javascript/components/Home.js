import React from "react"
import { Badge, Row, Col } from 'react-bootstrap'
import axios from 'axios'

import RateChannel from '../channels/RateChannel'

class Home extends React.Component {

  constructor(props) {
    super(props);
    this.state = { rates: [] }
    this.handleRateChannel = this.handleRateChannel.bind(this)
  }

  handleRateChannel(rates) {
    this.setState({ rates: rates })
  }

  componentDidMount() {
    new RateChannel({
      received: this.handleRateChannel
    })
    axios
      .get('/api/v1/rates')
      .then(response => {
        this.setState({ rates: response.data })
      })
  }

  render() {
    return (
      <React.Fragment>
        {this.state.rates.map(rate => (
          <Row key={rate.id}>
            <Col>
              <h3>
                {rate.title}: <Badge variant="secondary">{rate.current}</Badge>
              </h3>
            </Col>
          </Row>
        ))}
      </React.Fragment>
    );
  }
}

export default Home
