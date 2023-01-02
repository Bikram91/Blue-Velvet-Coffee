import csrfFetch from "./csrf";
import { storeCurrentUser } from "./csrf";

const RECEIVE_USER = 'session/RECEIVE_USER';
const REMOVE_USER = 'session/REMOVE_USER';

export const receiveCurrentUser = (user) => (
  {
    type: RECEIVE_USER,
    payload: user
  }
)

export const removeCurrentUser = (userId) => (
  {
    type: REMOVE_USER,
    userId
  }
)

const storeCSRFToken = response => {
  const csrfToken = response.headers.get("X-CSRF-Token");
  if (csrfToken) sessionStorage.setItem("X-CSRF-Token", csrfToken);
}


export const signupUser = (user) => async (dispatch) => {
  const response = await csrfFetch('/api/users', {
    method: 'POST',
    body: JSON.stringify(user)
  });
  const data = await response.json();
  storeCurrentUser(data.user);
  dispatch(receiveCurrentUser(data.user));
  return response;
};

export const loginUser = user => async dispatch => {
  const response = await csrfFetch('/api/session', {
    method: 'POST',
    body: JSON.stringify(user)
  })

  const data = await response.json();
  storeCurrentUser(data.user);
  dispatch(receiveCurrentUser(data.user));
  return response;
}


export const logoutUser = () => async (dispatch) => {
  const response = await csrfFetch("/api/session", {
    method: "DELETE"
  });
  storeCurrentUser(null);
  dispatch(removeCurrentUser());
  return response;
};


const initialState = {
  user: JSON.parse(sessionStorage.getItem("currentUser"))
};


const sessionReducer = (state = initialState, action) => {
  switch (action.type) {
    case RECEIVE_USER:
      return { ...state, user: action.payload };
    case REMOVE_USER:
      return { ...state, user: null };
    default:
      return state;
  }
};


export default sessionReducer;