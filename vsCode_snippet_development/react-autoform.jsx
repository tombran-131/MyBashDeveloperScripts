// _todo: support radio buttons and checkboxes

// https://reactjs.org/docs/forms.html
// https://www.w3schools.com/html/html_forms.asp

import React from 'react';

/**
 * @prop {Bound Function} handleChange
 * @prop {Bound Function} handleSubmit
 * @prop {Array [Objects]} inputs :=  { name: String, type: 'text' || 'submit' || 'button', value: Any Scalar }
 */
class AUTOFORM extends React.Component {

  constructor(props) {
    super(props);
    this.handleChange = this.props.handleChange;
  };

  render() {
    //console.table(`From form component: this.data = ${this.data}`);
    return(
      <div className="form-container">
        <form onSubmit={this.props.handleSubmit}>
          {
            this.props.inputs.map(input => (
              <label className={`${input.name}-label`}>
                {input.name}
                <input
                  className={`${input.name}-input`}
                  type={input.type}
                  value={input.value}
                  onChange={this.handleChange}
                />
              </label>
            ))
          }
          <input type="submit" value="Submit" />
        </form>
      </div>
    );
  }
}

export default AUTOFORM;
