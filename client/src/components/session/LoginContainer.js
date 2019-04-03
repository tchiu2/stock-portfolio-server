import { connect } from 'react-redux';
import SessionForm from './SessionForm';
import { login, clearErrors } from '../../actions/session_actions';

const msp = ({ errors: { session } }) => ({
  user: { email: '', password: '' },
  errors: session,
  formType: 'login',
});

const mdp = dispatch => ({
  processForm: user => dispatch(login(user)),
  clearErrors: () => dispatch(clearErrors()),
});

export default connect(msp, mdp)(SessionForm);
