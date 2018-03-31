import { postUser, postSession, deleteSession } from '../util/session_api_util';

export const RECEIVE_CURRENT_USER = 'RECEIVE_CURRENT_USER';


export const receiveCurrentUser = (currentUser) => ({
  type: RECEIVE_CURRENT_USER,
  currentUser
});

export const createNewUser = formUser => dispatch =>  postUser(formUser)
  .then(user => dispatch(receiveCurrentUser(user)));
