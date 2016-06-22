var Console = React.createClass({
  getInitialState: function() {
    return {
      response: null
    };
  },

  submitEndpoint: function(event) {
    event.preventDefault();

    var refs = this.refs
    var data = {};

    Object.keys(refs).forEach(function(key) {
      data[key] = refs[key].value;
    });

    $.ajax({
      url: this.props.url,
      type: this.props.method,
      data: $.param(data),
      success: this.submitEndpointSuccess
    });
  },

  submitEndpointSuccess: function(data) {
    this.setState({
      response: data
    });

    $('pre.code').each(function(i, block) {
      hljs.highlightBlock(block);
    });
  },

  render: function() {
    return (
      <div className='console'>
        <form action={this.props.url} method={this.props.method} onSubmit={this.submitEndpoint} className='m-b-3'>
            {this.props.params.map(function(param) {
              return (
                <div className='form-group' key={param.name}>
                  <label>{param.name}</label>
                  <input type='text' className='form-control' defaultValue={param.example} ref={param.name}/>
                </div>
              )
            })}
          <div class='form-group'>
            <button type='submit' className='btn btn-primary'>Submit</button>
          </div>
        </form>
        <div className='card'>
          <div className='card-header'>Response</div>
          <pre className='code hljs json'>{JSON.stringify(this.state.response, null, 2)}</pre>
        </div>
      </div>
    );
  }
});
